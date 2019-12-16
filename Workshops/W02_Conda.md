---
Title: W03_Conda.md
Author: Yan Li
Date: 10/12/2019, Tue
layout: page
---

# Conda Practise

## Installation

2. To install `conda`. Copy `miniconda` package from my dir `/yan/Miniconda3-latest-Linux-x86_64.sh` to your folder. Run 

    ```sh
    bash Miniconda3-latest-Linux-x86_64.sh
    ```

    Input `yes` or `y` when necessary during installation.

3. Restart your terminal, or run 
   
   ```sh
   source ~/.bashrc
   ```
   
4. Run 
   
   ```sh
   source activate
   ```

    to start `conda` environment. Notice the `(base)` before your username.

5. Read the document by 
   
   ```sh
   conda --help
   ```
   
   You can go deeper by 
    
   ```sh
   conda install --help
   conda env --help
   ```


6. Create a new environment called `bioinfo`, enter the new environment:

    ```sh
    conda create -n bioinfo
    conda activate bioinfo
    ```

7. Install the tools we will use in this course. I put them in a list, copy the `packages.txt` from my dir, then run:

    ```sh
    conda config --add channels bioconda   # add the bioconda channel
    conda install --file packages.txt
    ```

    It may take a while.

8. Deactivate the environment by:

    ```sh
    conda deactivate
    ```