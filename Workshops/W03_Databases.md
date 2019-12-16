---
Title: W02_Databases.md
Author: Yan Li
Date: 09/12/2019, Mon
layout: page
---

# Database practice

## Explore a gene

SopD is an effector protein of *Salmonella* Typhimurium functions to alter host cell physiology and promote bacterial survival in host tissues. It contributes to the replication of bacterial in macrophages. We will explore the detail of *sopD* gene in multiple databases in order to understand what do we expect from these databases in Bioinformatic study.

### NCBI GenBank

1. Go to http://www.ncbi.nlm.nih.gov/ , enter `salmonella typhimurium[orgn] AND sopd` and click `Search`. By default you search ALL the databases and the results also include many that refer to this topic but are not necessarily specifically about *sopD*. How many nucleotide sequences are returned? ___

    Click at ‘Nucleotide’ to see the Result Page. Examine the accession number for each entry in the new page. 

2. Click on the sequence “Acession: AF234265.1”.
   1. Read the GenBank file. When did the sequence uploaded? ___ How many publications are there about this sequence? ___
   2. Click at `Graphics` in the top left. Explore the graph, Try zoom in, zoom out, and move left or right. What's the start and end position of the gene on the Salmonella Typhimutium genome? ___ to ___
   3. Click at `Fasta` in the top left, and then click at `send to` in the top right, choose `file`, save the file to a local folder as `sopD_gene.fasta`

### UniProt

1. Go to https://www.uniprot.org/, enter `salmonella typhimurium sopd` and click `Search`. How many manually reviewed results, and how many unreviewed results are returned? ___
2. Click on the Entry `P40722`. Read the results. Try find the following information:
    1. What's the subcellular location of the protein?
    2. What's the resolution of the protein structure?
    3. Download the fasta file and save as `sopD_protein.fasta`.
    4. Find the KEGG link from the `Genome annotation databases`. Go to KEGG

### KEGG

1. Read the information on the KEGG page.
2. Click the link after `Pathway`. What's the downstream protein of `sopD` in the "Bacterial invasion of epithelial cells" pathway? 

## Download a reference genome

1. Go to http://www.ncbi.nlm.nih.gov/ and enter `salmonella typhimurium` and click `Search`. How many results are returned from `assembly` database?
2. Click on `assembly` database, choose the entry `ASM694v2`. 
   1. Read the page, click the link after `Organism name`. Which journal and when did the sequence first published?
   2. Back to the `ASM694v2` page, click the `Download Assembly` button at the top right. Download the `genomic fasta`, `genomic GFF` and `genomic genbank file` from `refseq` database. Save as `salmonella_typhimurium_lt2.fasta`, `salmonella_typhimurium_lt2.gff` and `salmonella_typhimurium_lt2.gb`
3. Back to the NCBI search result page, this time go to `SRA` database.
   1. Choose the first entry. Now you see the record of a sequencing data of a *Salmonella* Typhimurium strain. What's the sequencing machine used? What's the size of the raw data?
   2. Click the link after `Sample`. This is the metadata of the *Salmonella* Typhimurium strain bacterial. Where, when and from which source did this bacterial sampled?
   3. Back to the `SRA` page. Click the link under `run`, now you will see the metadata of the sequence.
   4. Open terminal, login to the server, download the sequence use `sra-tools` with the `SRR` run id:

    ```sh
    source activate bioinfo
    fastq-dump --split-3 --gzip SRR10561173
    ```

    It may take a long time. Be patient, we don't need this file today.

    More about `sra-tools`: [sra-tools documentation](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc)

## Visualise the reference genome

1. Download the `Artemis` installation package and install.
2. Start `Artemis`, click `File` - `Open`, open `salmonella_typhimurium_lt2.fasta`, load the genome sequence
3. Click `File` - `Read an entry`, open `Salmonella_typhimurium_lt2.gff`, load the annotation file.
4. Getting around in `Artemis`
5. Try the `Goto` menu. Click `Goto` - `Navigator`
   1. Fill a number in `goto base` form. Then click `Goto`
   2. Fill `sopD` in `Goto Feature with gene name`, then click `Goto`
6. Try the `Select` menu. Click `Select` - `Feature selector`, Select and view all `tRNAs`
7. Take your time play with `Artemis`! 