library(ggplot2)

# We will be using the mtcars dataset
head(mtcars)
#                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

# Let's see if there are differences between the groups of cyl in the mpg variable.
data = mtcars[, c('mpg','cyl')]

fit = lm(mpg ~ cyl, data=mtcars)
anova(fit)

# Analysis of Variance Table
# Response: mpg
#           Df Sum Sq Mean Sq F value    Pr(>F)    
# cyl        1 817.71  817.71  79.561 6.113e-10 ***
# Residuals 30 308.33   10.28
# Signif. codes:  0 *** 0.001 ** 0.01 * 0.05 .

# Plot the distribution
png('analysis_of_variance/boxplot_anova.png')
plot(mpg ~ as.factor(cyl), data=mtcars, col='deepskyblue3')
dev.off()