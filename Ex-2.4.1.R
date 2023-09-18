# This is a comment, it allows you to annotate your code

# Loads tidyverse.
library(tidyverse)

# Prints the working dir to the screen.
getwd()

# Sets the working dir to "Ex_UnderstandingSomeCode".
setwd("Ex_UnderstandingSomeCode")

# Loads the csv file @vv into memory and assigns it to be the value of D. 
D <- "https://vincentarelbundock.github.io/Rdatasets/csv/AER/FrozenJuice.csv" |> read.csv()

# Prints out 6 rows of the dataset in D.
D |> head()

# Maps the dataset D, adding a column. `deflated_price` is set to `price/ppi`
D <- D |> mutate(deflated_price = price/ppi)

# Filters the dataset at D, but does not replace D. Excludes all values such that `fdd>0`
d <- D |> filter(fdd>0)

# This is a plot.
plt<-(
  # Using ggplot. The data plotted is D, and the values taken for the x and y axis are `fdd` and `deflated_price`.
  ggplot(data=D,aes(x=fdd,y=deflated_price))
    # It's a scatterplot.
    +geom_point()
    # ~Theming~ This makes the plot easier to look at.
    +theme_bw()
    # These two lines set the labels of the two axis.
    +xlab("Freezing degree days")
    +ylab("Price of orange juice (deflated)")
)

# This saves the plot as a .png in the working directory.
ggsave("plot.png",plot = plt)

# This saves the plot to the Plots section of RStudio.
# I admit, I am unsure how it is stored exactly. I suspect it is an svg of some sort.
plt |> print()

# cd .. # We move out of the directory from before.
setwd("../")

# getwd()