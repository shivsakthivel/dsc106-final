# Required Libraries
install.packages('ggplot2')
install.packages('plotly')
install.packages('htmlwidgets')
library(ggplot2)
library(plotly)
library(htmlwidgets)

# Importing dataset
v1 <- read.csv("C:/Users/shivs/Downloads/v1.csv")

# Creating the plot
p <- ggplot(v1, aes(x, y, fill= Frequency, label = Space.Name)) + 
  geom_tile() +
  geom_label(fill = "white") +
  scale_fill_gradient(low="white", high="red3") +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank()) +
  ggtitle("Monopoly Board Space Frequencies")

pp <- ggplotly(p)
saveWidget(pp, file=paste0( getwd(), "/ggplotlyHeatmap.html"))
pp
