---
Title: W04_BLAST.md
Author: Yan Li
Date: 11/12/2019, Wed
layout: page
---

# Blast practice

## Blast with NCBI

- Go to [NCBI](https://www.ncbi.nlm.nih.gov/blast)
- Click `Protein BLAST`
- upload `sopD_proteinfasta` file, choose the database `swissprot`, click `Algorithm parameters` at the bottom, check all the options. Click `BLAST`
- The BLAST may run for a while. Check the results:
  - How many hits are there?
  - Check the `Query cover`, `E value`, `Per. Idet`. How many hits have a E-value lower than 10e-6? What does this mean?
  - Click the second alignment. How many `Identities`, `Positives` and `Gaps`?

## Run a local Blast

- Use `Filezilla`, upload `sopD_gene.fasta`, `salmonella_typhimurium_lt2.fasta` to server.
- Run `Blast` from your conda virtual environment:

    ```sh
    conda activate bioinfo
    makeblastdb -in sopd_gene.fasta -dbtype nucl -out sopD
    blastn -query salmonella_typhimurium_lt2.fasta -db sopD -out sopD_lt2.txt -outfmt 1
    ```

    Read the `help` document of each program before you run it. Make sure you understand all the parameters you typed in.

    After the program completes, read the output file `sopD_lt2.txt`

    Try another output format:

    ```sh
    blastn -query salmonella_typhimurium_lt2.fasta -db sopD -out sopD_lt2_fmt6.tsv -outfmt 6
    ```

## Visualise the blast results

- Run `act` on your laptop
- Click `File` -`Open`, open `sopd_gene.fasta` as sequence 1, `sopD_lt2_fmt6.tsv` as comparison file, `salmonella_typhimurium_lt2.fasta` as sequence 2.
- When the `act` window open, use the scrollbar at top-right to zoom in. Double click the red bar in the middle, to put the match sequence in the center. What is the position of *Salmonella* Typhimurium genome that matches the *sopD* gene?