# Required Libraries
install.packages("networkD3", repos = "http://cran.us.r-project.org")
install.packages("dplyr", repos = "http://cran.us.r-project.org")
install.packages("htmlwidgets", repos = "http://cran.us.r-project.org")
library(networkD3)
library(dplyr)
library(htmlwidgets)

# Importing the dataset
viz_4 <- read.csv("C:/Users/shivs/Downloads/v4.csv")

# Instantiating Chance #1 as the source for all edges
viz_4$From = c("Chance #1")
# Removing Chance #1 as a destination
v4 <- viz_4[-c(4), ]
nodes <- data.frame(
  name=c(as.character(v4$From), 
         as.character(v4$Space.Name)) %>% unique()
)

v4$IDsource <- match(v4$From, nodes$name)-1 
v4$IDtarget <- match(v4$Space.Name, nodes$name)-1

plot <- sankeyNetwork(Links = v4, Nodes = nodes,
                      Source = "IDsource", Target = "IDtarget",
                      Value = "Count", NodeID = "name",
                      fontSize = 14, fontFamily = "arial",
                      sinksRight=FALSE)
saveWidget(plot, file=paste0( getwd(), "/sankeyChance.html"))
plot