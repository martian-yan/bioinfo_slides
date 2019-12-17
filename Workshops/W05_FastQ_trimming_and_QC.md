---
Title: W05_FastQ_trimming_and_QC.md
Author: Yan Li
Date: 10/12/2019, Tue
layout: page
---

# FastQ trimming and QC

Use the raw reads we downloaded from NCBI.

## Installation

Install necessary packages

```sh
conda activate bioinfo
conda install fastqc trimmomatic seqtk
```

## Have a look at the fastq file:

`zcat` can read a `.gz` compressed fastq file without extract it. Have a look at the first lines of the file.

```sh
zcat SRR10561173_1.fastq.gz | head
```

Check the quality of the raw reads:

```sh
mkdir ~/fastqc
fastqc -o ~/fastqc -f fastq ~/raw_data/SRR10561173_1.fastq.gz ~/raw_data/SRR10561173_2.fastq.gz
```

**Notice**: A good pratice:

- **Always** put your file in single directories, for example, put raw data into `~/raw_data/`, put `fastqc` result into `~/fastqc`.
- **Always** use absolute paths when running commands, for example, use `~/raw_data/SRR10561173_1.fastq.gz` to tell the machine the position of the file.

Open the `fastqc` result. Understand the meaning of each section.

## Trimming

- Use trimmomatic to trim the adapter. Find out the adaptor sequence according to the sequence platform and [trimmomatic document](http://www.usadellab.org/cms/index.php?page=trimmomatic), or use the adapter according to the FastQC `adapter content` section.

| Adapter sequence | Sequence platform |
|:-----------------|:------------------|
| TruSeq2 | GAII |
| TruSeq3 | HiSeq, MiSeq |

The adaptor sequence is usually in the folder `~/miniconda2/envs/[environment name]/share/trimmomatic/adapters/`

For example:

```sh
mkdir trimmomatic
FA=~/miniconda2/envs/bioinfo/share/trimmomatic/adapters/TruSeq3-PE-2.fa
trimmomatic PE SRR10561173_1.fastq.gz SRR10561173_2.fastq.gz -baseout ./trimmomatic/SRR10561173.fastq.gz ILLUMINACLIP:$FA:2:30:10
```

- Use `seqtk` to do the quality trim.

    ```sh
    mkdit seqtk
    cd trimmomatic
    for i in *fastq.gz; do out=${i%%.*}; seqtk trimfq $i > ~/seqtk/${out}_seqtk.fastq; done
    ```

- Run `fastqc` again to check the quality of the reads after trimming.