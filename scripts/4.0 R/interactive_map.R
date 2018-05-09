# Install packages and libraries
install.packages("leaflet", repos = "http://cran.us.r-project.org")
library(leaflet)
library(sp)

# Retrieve mapping file
data <- read.csv("allyears_map_corrected.csv")

# Check contents of long/lat columns are numerical:
data$SampleLongitude <- as.numeric(data$SampleLongitude)
data$SampleLatitude <- as.numeric(data$SampleLatitude)

# Specify which columns are long and lat in mapping file
data.SP <- SpatialPointsDataFrame(data[,c(8,9)], data[,-c(8,9)])

# Add markers
m <- leaflet() %>% addTiles() %>%
  addCircleMarkers(data = data, lng = ~SampleLongitude, lat = ~SampleLatitude, popup = ~X.SampleID)

# Run programme
m
