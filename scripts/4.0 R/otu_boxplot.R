# Loading the libraries
library(reshape2)
library(ggplot2)

# Loading the data onto R
data1 <- read.csv("summary_otu_count_for_boxplot.csv")

# Double check R has properly loaded the data
attach(data1)
names(data1)

# Generating a boxplot with colours, labelled axes and figure legend
ggplot(melt(data1), aes(variable, value)) +
  geom_boxplot(aes(fill = variable)) +
  theme_bw() +
  theme(legend.text = element_text(size = 9), legend.title = element_text(size = 9)) +
  theme(axis.text = element_text(size = 9)) +
  theme(axis.title = element_text(size = 9)) +
  labs(x = "OTU picking method", y = "Observed OTU count",colour = "legend") +
  annotation_logticks(sides = "rl") +
  theme(panel.grid.minor = element_blank()) +
  guides(title.hjust = 1.0) +
  theme(plot.margin = unit(c(0,1,0,0),"mm"))
