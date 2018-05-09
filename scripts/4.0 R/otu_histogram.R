## This script has been adapted from Dan Knights' lab.

# Install biom package
source("https://bioconductor.org/biocLite.R")

# Load biom package
biocLite("biomformat")
library('biomformat')

# Load dataset using biom package
silva.otus.biom <- read_biom('otu_table_json.biom')

# Extract OTU counts from biom table
silva.otus <- as.matrix(biom_data(silva.otus.biom))

# Transpose so rows are samples and columns are OTUs
silva.otus <- t(silva.otus)

# Plot histogram of sample depths
depths <- rowSums(silva.otus)
hist(depths,breaks=30)

# Plot histograms of OTU frequences
otu.counts <- colSums(silva.otus > 0)
hist(otu.counts,breaks=30)

# Remove OTUs present in <10% of samples
silva.otus <- silva.otus[,colMeans(silva.otus) >= .1]
depths <- rowSums(silva.otus)
dim(silva.otus)

# Now we can re-plot the histogram with OTU singletons removed
otu.counts <- colSums(silva.otus > 0)
hist(otu.counts,breaks=30)

# Remove samples with very low depth
sort(depths)[1:10]
silva.otus <- silva.otus[depths >= 1000,]
dim(silva.otus)

# Load mapping file
silva.map <- read.table('/lustre/home/d411/alorax1/data/2018/updated_2018_map_v2.txt',sep='\t',head=T,row=1,check=F,comment='')

# Ensure mapping file and OTU table contain samples in the same order
sample.ids <- intersect(rownames(silva.otus), rownames(silva.map))

# Put the samples in alphabetical order
sample.ids <- sort(sample.ids)

# Subset using sample IDs
silva.otus <- silva.otus[sample.ids,]
silva.map <- silva.map[sample.ids,]
dim(silva.otus)
dim(silva.map)