## Script adapted from Dan Knights' Labs

# Load packages
library('biomformat')
library('vegan')

# Load biom file, extract genus counts and transpose
genus.biom <- read_biom('otu_table_L6_json.biom')
genus <- as.matrix(biom_data(genus.biom))
genus <- t(genus)

# Load mapping file and make sure IDs from both tables line up correctly
map <- read.table('/lustre/home/d411/alorax1/data/2018/updated_2018_map_v2.txt', sep='\t', comment='', head=T, row.names=1)
common.ids <- intersect(rownames(map), rownames(genus))
genus <- genus[common.ids,]
map <- map[common.ids,]
dim(genus)

# Drop genera present in <10% samples
genus <- genus[,colMeans(genus > 0) >= .1]
dim(genus)

colnames(genus)[1:10]
colnames(genus) <- sapply(strsplit(colnames(genus),';'),function(xx) paste(paste(substr(xx[-c(1,length(xx))],4,7),collapse=';'),substring(xx[length(xx)],4),sep=';'))
genus[1:10,1:2]
colnames(map)
table(map$Month)

# Selecting Streptosporangium to run statistical tests on
grep('Streptosporangium$',colnames(genus))
Streptosporangium <- genus[,grep('Streptosporangium$',colnames(genus))]
hist(Streptosporangium, br=30)

# Running Pearson's product-moment correlation
cor.test(Streptosporangium, map$SampleDepth)
cor.test(Streptosporangium, map$SampleLongitude)
cor.test(Streptosporangium, map$SampleLatitude)
cor.test(Streptosporangium, map$SampleWeatherTemp)
cor.test(Streptosporangium, map$SamplePh)

fit <- lm(Streptosporangium ~ map$SampleDepth)
summary(fit)

# To get the exact p-value
pval <- anova(fit)['map$SampleDepth','Pr(>F)']
pval

