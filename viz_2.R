# Required Libraries
install.packages('chorddiag', repos = "http://cran.us.r-project.org")
install.packages('htmlwidgets',repos = "http://cran.us.r-project.org")
library(chorddiag)
library(htmlwidgets)

# Importing datasets
v2 <- read.csv("C:/Users/shivs/Downloads/v2.csv")
spaces <- read.csv("C:/Users/shivs/Downloads/spaces.csv")

# Converting list of edges into adjacency matrix, then into dataframe
adjacencyData <- with(v2, table(v2$I_current, v2$I_next))
m <- as.matrix(adjacencyData)
df = data.frame("Go" = m[, 1])
for(i in 2:40){
  name <- spaces[i, 2]
  df[name] <- m[, i]
}
df = as.matrix(df)

# Creating the plot
viz_2 <- chorddiag(df, type = "directional", showTicks = F, 
                   groupnameFontsize = 7, groupnamePadding = 10, margin = 90)
saveWidget(viz_2, file=paste0( getwd(), "/chord_interactive.html"))
viz_2
