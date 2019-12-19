---
Title: W06_Assemble.md
Author: Yan Li
Date: 11/12/2019, Wed
layout: page
---

# Assembly

Use the most popular assembler `SPAdes` to assemble a bacterial genome.

## Installation

```sh
conda install spades
```

## Assembly

When using SPAdes it is typical to choose at least 3 k-mer sizes. One low, one medium and one high. We will use 33, 55 and 91.

First merge the unpaired reads

```sh
cd seqtk
cat SRR10561173_2U_seqtk.fastq.gz >> SRR10561173_1U_seqtk.fastq.gz
rm SRR10561173_2U_seqtk.fastq.gz
mv SRR10561173_1U_seqtk.fastq.gz SRR10561173_U_seqtk.fastq.gz
cd ..
```

then run `spades`

```sh
spades.py -1 ~/seqtk/SRR10561173_1P_seqtk.fastq.gz -2 ~/seqtk/SRR10561173_2P_seqtk.fastq.gz -s ~/seqtk/SRR10561173_U_seqtk.fastq.gz -k 33,55,91 -o ~/assembly
```

Check the result.

| File | content |
|:-----|:--------|
| contigs.fasta | assembled contigs |
| scaffolds.fasta | assembled scaffolds |
| assembly_graph.fastg | the graph of contigs |
| assembly_graph_with_scaffolds.gfa | the graph of scaffolds |
| spades.log | the log file of the spades running |

## Quanlity assessment of the assembly

- Install `quast` and `bandage`

    `quast` have some compatibility problem with the bioinfo environment, the solution is to install it in a separate environment.

    ```sh
    conda create -n quast
    conda activate quast
    conda install quast
    ```

- Run `quast`

    `quast` use a reference to assess the quality of the assembly. Upload the reference genome and annotation file `salmonella_typhimurium_lt2.fasta` and `salmonella_typhimurium_lt2.gff` to the server.

    ```sh
    quast ~/assembly/SRR10561173.fasta -R ~/seq/salmonella_typhimurium_lt2.fasta -G ~/seq/salmonella_typhimurium_lt2.gff -o ~/quast/
    ```

    Check the result.

- Run `bandage`

    Download and install `bandage` from [bandage website](https://rrwick.github.io/Bandage/), or copy from my folder.

    Download the `FASTG` graph file of `SPAdes` to your laptop, open it with `bandage`. 

