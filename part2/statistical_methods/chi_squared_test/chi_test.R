library(ggplot2)

# Use the table function to compute the contingency table
tbl = table(diamonds$cut, diamonds$color)
tbl

#              D    E    F    G    H    I    J
# Fair       163  224  312  314  303  175  119
# Good       662  933  909  871  702  522  307
# Very Good 1513 2400 2164 2299 1824 1204  678
# Premium   1603 2337 2331 2924 2360 1428  808
# Ideal     2834 3903 3826 4884 3115 2093  896

# In order to run the test we just use the chisq.test function.
chisq.test(tbl)

# Pearson's Chi-squared test
# data:  tbl
# X-squared = 310.32, df = 24, p-value < 2.2e-16

# It is also possible to compute the p-values using a monte-carlo simulation
# It's needed to add the simulate.p.value=TRUE flag and the amount of simulations
chisq.test(tbl, simulate.p.value=TRUE, B=2000)

# Pearson's Chi-squared test with simulated p-value (based on 2000 replicates)
# data:  tbl
# X-squared = 310.32, df = NA, p-value = 0.0004998
