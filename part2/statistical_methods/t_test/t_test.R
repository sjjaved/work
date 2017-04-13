library(ggplot2)

# The idea of t.test is to evaluate if there are differences in a numeric variable 
# distribution between diferent groups of a nominal variable.

# In order to demonstrate this, I will select the levels of the Fair and Ideal levels of the factor variable cut
# Then we will compare the values a numeric variable among those two groups
data = diamonds[diamonds$cut %in% c('Fair', 'Ideal'), ]
data$cut = droplevels.factor(data$cut) # Drop levels that aren't used from the cut variable
df1 = data[, c('cut', 'price')]

# We can see the price means are different for each group
tapply(df1$price, df1$cut, mean)
# Fair    Ideal 
# 4358.758 3457.542 

## Formula interface to t.test
# The idea is that the numeric variable is explained by a group variable
# t.test(numeric_variable ~ group_variable, data = data)

# In our case. 
# The numeric_variable is price
# The group_variable is cut
t.test(price ~ cut, data = data)

# Welch Two Sample t-test
# 
# data:  price by cut
# t = 9.7484, df = 1894.8, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   719.9065 1082.5251
# sample estimates:
#   mean in group Fair mean in group Ideal 
#   4358.758            3457.542 

# Another way to validate the previous results is to just plot the distributions using a box-plot
plot(price ~ cut, data = data, ylim=c(0,12000), 
     col = 'deepskyblue3')

png('t_test/ttest_boxplot.png')
plot(price ~ cut, data = data, ylim=c(0,12000), 
     col = 'deepskyblue3')
dev.off()
