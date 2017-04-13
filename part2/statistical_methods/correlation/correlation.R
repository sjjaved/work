library(ggplot2)

# Select variables that are interesting to compare pearson and spearman correlation methods.
x = diamonds[, c('x', 'y', 'z', 'price')]

# From the histograms we can expect differences in the correlations of both metrics. 
# In this case as the variables are clearly not normally distributed, the spearman correlation
# is a better estimate of the linear relation among numeric variables.
par(mfrow=c(2,2))
colnm = names(x)
for(i in 1:4){
  hist(x[[i]], col='deepskyblue3', main=sprintf('Histogram of %s', colnm[i]))
}
par(mfrow=c(1,1))


## Correlation Matrix - Pearson and spearman
cor_pearson <- cor(x, method='pearson')
cor_spearman <- cor(x, method='spearman')

### Pearson Correlation
print(cor_pearson)
#               x         y         z     price
# x     1.0000000 0.9747015 0.9707718 0.8844352
# y     0.9747015 1.0000000 0.9520057 0.8654209
# z     0.9707718 0.9520057 1.0000000 0.8612494
# price 0.8844352 0.8654209 0.8612494 1.0000000

### Spearman Correlation
print(cor_spearman)
#               x         y         z     price
# x     1.0000000 0.9978949 0.9873553 0.9631961
# y     0.9978949 1.0000000 0.9870675 0.9627188
# z     0.9873553 0.9870675 1.0000000 0.9572323
# price 0.9631961 0.9627188 0.9572323 1.0000000


# Image from the chapter
png('histograms_correlation.png')
par(mfrow=c(2,2))
colnm = names(x)
for(i in 1:4){
  hist(x[[i]], col='deepskyblue3', main=sprintf('Histogram of %s', colnm[i]))
}
par(mfrow=c(1,1))
dev.off()
