# Required Libraries
install.packages('ggplot2')
library(ggplot2)

# Importing the dataset
v3 <- read.csv("C:/Users/shivs/Downloads/v3.csv")

# Creating the plot
ggplot(v3, aes(x=Space.Name, y=Profit, fill = Space.Name)) + 
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("brown4", "chocolate1", "forestgreen") ) +
  theme(legend.position="none") +
  ggtitle("The most profitable Community Chest") +
  xlab("Space") +
  ylab("Profit (in $)")
