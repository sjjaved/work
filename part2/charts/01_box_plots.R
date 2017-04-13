# We will be using the ggplot2 library for plotting
library(ggplot2)

data("diamonds")

# We will be using the diamonds dataset to analyze distributions of numeric variables
head(diamonds)
#   carat       cut color clarity depth table price    x    y    z
# 1  0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
# 2  0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
# 3  0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
# 4  0.29   Premium     I     VS2  62.4    58   334 4.20 4.23 2.63
# 5  0.31      Good     J     SI2  63.3    58   335 4.34 4.35 2.75
# 6  0.24 Very Good     J    VVS2  62.8    57   336 3.94 3.96 2.48

### Box-Plots

p = ggplot(diamonds, aes(x=cut, y=price, fill=cut)) +
  geom_boxplot() +
  theme_bw()
p

png('01_Boxplot_diamonds_cut.png')
print(p)
dev.off()


