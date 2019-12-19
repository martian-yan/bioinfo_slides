---
Title: W07_Identify_variations.md
Author: Yan Li
Date: 11/12/2019, Wed
layout: page
---

# Identify variations

## Installation

```sh
conda install bwa samtools gatk4 snpeff
```

## The workflow

- Mapping reads to the reference

    ```sh
    source activate bioinfo
    # Index the reference
    mkdir ~/call_snp
    bwa index ~/seq/salmonella_typhimurium_lt2.fasta

    # Mapping
    bwa mem -t 4 -R '@RG\tID:foo\tPL:illumina\tSM:SRR1056117' ~/seq/salmonella_typhimurium_lt2.fasta  ~/seqtk/SRR10561173_1P_seqtk.fastq.gz ~/seqtk/SRR10561173_2P_seqtk.fastq.gz | samtools view -Sb - > ~/call_snp/SRR10561173.bam

    # Sort
    samtools sort -@ 4 -m 4G -O bam -o ~/call_snp/SRR10561173.sorted.bam ~/call_snp/SRR10561173.bam

    # Mark duplicates
    gatk MarkDuplicates -I ~/call_snp/SRR10561173.sorted.bam -O ~/call_snp/SRR10561173.sorted.markdup.bam -M ~/call_snp/SRR10561173.sorted.markdup_metrics.txt

    # Index the bam file
    samtools index ~/call_snp/SRR10561173.sorted.markdup.bam
    ```

    Now we can view the bam file use `samtools tview`  

    ```sh
    samtools tview ~/call_snp/SRR10561173.sorted.markdup.bam --reference ~/seq/salmonella_typhimurium_lt2.fasta
    ```

    Press `?` to read the shortcut in `tview`, press `q` to quit.

    `IGV` is another popular tool to visualise `bam` file

- Call SNPs
  
    ```sh
    # make fasta index
    samtools faidx ~/seq/salmonella_typhimurium_lt2.fasta

    # make fasta dict use gatk
    gatk CreateSequenceDictionary -R salmonella_typhimurium_lt2.fasta

    # make GVCF file
    gatk HaplotypeCaller -R ~/seq/salmonella_typhimurium_lt2.fasta --emit-ref-confidence GVCF -I ~/call_snp/SRR10561173.sorted.markdup.bam -O ~/call_snp/SRR10561173.g.vcf

    # make VCF file
    gatk GenotypeGVCFs -R ~/seq/salmonella_typhimurium_lt2.fasta -V ~/call_snp/SRR10561173.g.vcf -O ~/call_snp/SRR10561173.vcf
    ```

- Try make a Bash script

    for example, write a new file

    ```sh
    nano call_variations.sh
    ```

    In the nano editor, start with

    ```sh
    #!/bin/bash

    # input "salmonella_typhimurium_lt2" here
    REF=$1

    # input "SRR10561173"
    SRR=$2

    echo -e "###\nThe reference is $REF\n\n"
    echo -e "###\nWe are now dealing with $SRR\n\n"

    source activate bioinfo

    mkdir ~/call_snp

    bwa index ~/seq/${REF}.fasta

    bwa mem -t 4 -R '@RG\tID:foo\tPL:illumina\tSM:${SRR}' ~/seq/${REF}.fasta  ~/seqtk/${SRR}_1P_seqtk.fastq ~/seqtk/${SRR}_2P_seqtk.fastq | samtools view -Sb - > ~/call_snp/${SRR}.bam

    samtools sort -@ 4 -m 4G -O bam -o ~/call_snp/${SRR}.sorted.bam ~/call_snp/${SRR}.bam

    gatk MarkDuplicates -I ~/call_snp/${SRR}.sorted.bam -O ~/call_snp/${SRR}.sorted.markdup.bam -M ~/call_snp/${SRR}.sorted.markdup_metrics.txt

    samtools index ~/call_snp/${SRR}.sorted.markdup.bam
    ```

    Then you can run this script like:

    ```sh
    bash call_variations.sh salmonella_typhimurium_lt2 SRR10561173
    ```

    In this way we can make the whole workflow to be automatic.

- Annotate VCF file

    - Usually we can install `snpEff` database automatically. (not working here)
    
        e.g. Find what databases does `snpEff` know about the present.

        ```sh
        snpEff databases > listing.txt
        ```

        Find the information on *Salmonella* Typhimurium

        ```sh
        grep "typhimurium" listing.txt | head
        ```

        We need to download that database according to the name

        ```sh
        snpEff download Salmonella_enterica_subsp_enterica_serovar_typhimurium
        ```

        In this case, the chromosome ID of the database is not match with our reference. Therefore we need to build the database by ourselves.

    - This time let's build the database manually from the genbank file

        The database of snpEff is in the folder your_conda_path/envs/your_env/share/snpeff-version/data
        `mkdir` then copy the genbank file of the reference strain to this folder
        
        ```sh
        mkdir /home/yan/anaconda3/envs/course/share/snpeff-4.3.1t-3/data/salmonella_typhimurium_lt2/
        cp ~/salmonella_typhimurium_lt2.genbank /home/yan/anaconda3/envs/course/share/snpeff-4.3.1t-3/data/salmonella_typhimurium_lt2/genes.gbk

        # Edit snpEff config file
        cd /home/yan/anaconda3/envs/course/share/snpeff-4.3.1t-3/
        echo "salmonella_typhimurium_lt2.genome:salmonella_typhimurium_lt2" >> snpEff.config

        # Build
        snpEff build -genbank -v salmonella_typhimurium_lt2
        ```

        We can visualize the content of a database for example to check the chromosomal naming and have an understanding of what the database contains.

        ```sh
        snpEff dump salmonella_typhimurium_lt2 | less
        ```

    - Finally, we can annotate the VCF file with the `snpeff` database

        ```sh
        snpEff salmonella_typhimurium_lt2 SRR10561173.vcf > SRR10561173_annotated.vcf
        ```