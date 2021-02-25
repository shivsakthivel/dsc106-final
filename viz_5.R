# Required Libraries
install.packages('ggplot2')
install.packages('plotly')
install.packages('htmlwidgets')
library(ggplot2)
library(plotly)
library(htmlwidgets)

# Importing dataset
v5 <- read.csv("C:/Users/shivs/Downloads/v5.csv")

# Creating the plot
p5 <- ggplot(v5, aes(x, y, fill= benefit, label = Space.Name)) + 
  geom_tile() +
  geom_label(fill = "white") +
  scale_fill_gradient(low="white", high="green4") +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank()) +
  ggtitle("Monopoly Board Space Profitability")

p5_i <- ggplotly(p5)
saveWidget(p5_i, file=paste0( getwd(), "/moneyHeatmap.html"))
p5_i