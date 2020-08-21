# 16S rRNA Metagenomics Analysis
![](https://img.shields.io/badge/Module-BIOC3301-red.svg)
[![](https://img.shields.io/badge/language-R-blue.svg)](https://www.r-project.org/)
[![](https://img.shields.io/badge/cluster-Cirrus-178F8B.svg)](http://www.cirrus.ac.uk/)

**This repository is part of the assessment for the BIOC3301 Module at UCL.**

The project involved analysing microbial diversity by extracting 16S rRNA gene sequences from soil samples collected in London parks. The data was then processed and analysed using QIIME and further statistical tests were conducted using [R](https://www.r-project.org/). This repository contains all the scripts used for the NGS quality control and data processing stages, as well as for further downstream analysis.

For a brief overview of all the scripts used, a log file can be found [here](https://github.com/Alorax/BIOC3301-repo/blob/master/log.md).

## Setup information
QIIME v1.9.1 was used for the initial data processing and analysis. The (serial batch/parallel) bash scripts were submitted as jobs to be run on Cirrus, a High Performance Computing (HPC) system. To summarise this repository:
- PBS scripts are located in the `scripts` folder.
- The quality filtering and preprocessing outputs can be found in the `basic pipeline` folder.
- Further downstream analysis and statistical tests can be found in the `analyses` folder.
- Mapping files are located in the `maps` folder.
- All figures are located in the `figures` folder.
- The files in `scripts` and `analyses` are numbered in the order they were carried out.
- Comments are added in-line for each script and clarification of their use.
- The `core diversity analyses` results for `2018` and `all years` datasets can be viewed at http://astrdhr.github.io/metagenomics-research/index.html, along with the 2D PCoA plots for `all years`, as this data is interactive.

## Primer

The `16S rRNA` (ribosomal RNA) gene encodes for part of the ribosome (more specifically, the 30S small subunit) found in `prokaryotic cells`. Sections of this gene are `conserved` across the genomes of all `bacterial species`, and variations within the `coding sequence` are used to reconstruct `phylogenies`; allowing different bacterial species to be told apart along with how they are related to each other. Hence, highly complex bacterial `communities` are commonly identified using `16S rRNA gene sequencing`.
