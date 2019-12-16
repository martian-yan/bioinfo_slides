title: 03_Conda
author: Yan Li
plugins:

<slide class="bg-black-blue aligncenter" image="https://source.unsplash.com/C1HhAQrbykQ/ .dark">

# 03_Conda{.text-landing.text-shadow}

---

By Yan Li{.text-intro}

PhD in Bioinformatics, University of Liverpool{.text-intro}
    
<slide class="bg-light aligncenter">

## How do we install softwares in Linux?

---

- Compile from source code
- Download the binary file
- Use a package manager
  - from the system\:
    **`apt-get`** (Debian, Ubuntu), **`yum`** (CentOS, Red Hat), **`pacman`** (Arch, Manjaro), **`homebrew`** (Macos)

  - from a programming language\:
    **`pip`** (Python), **`cran`** (R)

  - Universal package manager\:
    **`conda`**
- Use a container\: **`docker`**, **`singularity`**

<slide class="bg-light aligncenter size-60">

## Virtual environment

---

```sh
# conda environments:
#
base                     /home/yan/anaconda3
ai                       /home/yan/anaconda3/envs/ai
bioinfo                  /home/yan/anaconda3/envs/bioinfo
course                *  /home/yan/anaconda3/envs/course
```

Put conflicting packages in seperate environments{.text-intro}

<slide class="bg-light aligncenter size-60">

## Manage packages

---

```sh
# packages in environment at /home/yan/anaconda3/envs/course:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main    conda-forge
blast                     2.9.0                h20b68b9_1    bioconda
boost                     1.68.0          py37h8619c78_1001    conda-forge
boost-cpp                 1.68.0            h11c811c_1000    conda-forge
...
```

Manage dependencies automatically{.text-intro}

<slide class="bg-light aligncenter size-60">

## Basic commands

---

```sh
# environment
conda create -n env-name
conda env list
conda activate env-name
conda deactivate

# package
conda install package-name
conda remove package-name
conda list
```

<slide class="bg-light aligncenter">

## Find a package

---

Go to [anaconda website  :fa-external-link:](https://anaconda.org/) and search

<slide class="bg-light aligncenter">

## Demonstration & Workshop