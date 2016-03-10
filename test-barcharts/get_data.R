# Separate file that will get specific dataset required for bar charts
library(dplyr)

data <- read.csv(file = "sample.csv", TRUE, sep = ",")

# Function will get specific column data
column_data <- function(colname) {
  col <- data$colname
}