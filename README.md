# 16S Metagenomics Notebook
![](https://img.shields.io/badge/Module-BIOC3301-red.svg)
[![](https://img.shields.io/badge/language-R-blue.svg)](https://www.r-project.org/)
[![](https://img.shields.io/badge/cluster-Cirrus-178F8B.svg)](http://www.cirrus.ac.uk/)

Here I lay bare all my scripts used in the Illumina data processing and further downstream analyses for my work.

## Setup information
QIIME v1.9.1 was used for the initial data processing and analyses. The (serial batch/parallel) bash scripts were submitted as jobs to be run on Cirrus, a High Performance Computing (HPC) system. These PBS scripts are located in the `Scripts` folder. A few notes:
- In my actual workflow I used `all_scripts.pbs`, and commented out the scripts I no longer needed. I found this method to be more efficient as I only worked with a single script, thus avoiding a cluttered folder and confusion with using the wrong script.
- However, for ease of understanding the different scripts used, I have provided appropriately named separate files for each.
- Comments are added in-line for each script and clarification of their use.
- For further downstream statistical tests, I mostly worked with QIIME and [R](https://www.r-project.org/).
- The resulting output of each of these scripts can be found in the `basic pipeline` (containing quality filtering and preprocessing outputs) and `analyses` (containing further downstream analyses and statistical tests) folders.
- Mapping files are located in the `maps` folder.
- All figures are located in the `figures` folder.
- The `scripts` are numbered in the order that they were carried out, as well as the `analyses`.
- The `core diversity analyses` results for `2018` and `all years` datasets can be viewed at https://alorax.github.io, along with the 2D PCoA plots for `all years`, as this data is interactive.

For a very brief overview of the scripts I used, a log file can be found [here](https://github.com/Alorax/BIOC3301-repo/blob/master/log.md).

## Primer

The `16S rRNA` (ribosomal RNA) gene encodes for part of the ribosome (more specifically, the 30S small subunit) found in `prokaryotic cells`. Sections of this gene are `conserved` across the genomes of all `bacterial species`, and variations within the `coding sequence` are used to reconstruct `phylogenies`; allowing different bacterial species to be told apart along with how they are related to each other. Hence, highly complex bacterial `communities` are commonly identified using `16S rRNA gene sequencing`.
