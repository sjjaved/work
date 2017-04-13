library(ggplot2)
data(diamonds)
# Correlation matrix plots

keep_vars = c('carat', 'depth', 'price', 'table')
df = diamonds[, keep_vars]

# compute the correlation matrix
M_cor = cor(df)
#          carat       depth      price      table
# carat 1.00000000  0.02822431  0.9215913  0.1816175
# depth 0.02822431  1.00000000 -0.0106474 -0.2957785
# price 0.92159130 -0.01064740  1.0000000  0.1271339
# table 0.18161755 -0.29577852  0.1271339  1.0000000

# plots
heatmap(M_cor)

# png('heatmap_correlation_matrix.png')
# heatmap(M_cor)
# dev.off()

library(GGally)
ggpairs(df)

png('scatterplot_matrix.png')
print(ggpairs(df))
dev.off()
