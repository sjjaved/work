# To start analyzing the flights data, we can start by checking if 
# there are correlations between numeric variables.
# Install the package corrplot by running
# install.packages('corrplot')

# then load the library
library(corrplot)

# Load the following libraries 
library(nycflights13)
library(ggplot2)
library(data.table)
library(reshape2)

# We will continue working with the flights data
DT <- as.data.table(flights)

head(DT) # take a look

# We select the numeric variables after inspecting the first rows.
numeric_variables = c('dep_time', 'dep_delay', 
                      'arr_time', 'arr_delay',
                      'air_time', 'distance')

# Select numeric variables from the DT data.table
dt_num = DT[, numeric_variables, with=FALSE]

# Compute the correlation matrix of dt_num
cor_mat = cor(dt_num, use="complete.obs")

print(cor_mat)
### Here is the correlation matrix
#              dep_time   dep_delay   arr_time   arr_delay    air_time    distance
# dep_time   1.00000000  0.25961272 0.66250900  0.23230573 -0.01461948 -0.01413373
# dep_delay  0.25961272  1.00000000 0.02942101  0.91480276 -0.02240508 -0.02168090
# arr_time   0.66250900  0.02942101 1.00000000  0.02448214  0.05429603  0.04718917
# arr_delay  0.23230573  0.91480276 0.02448214  1.00000000 -0.03529709 -0.06186776
# air_time  -0.01461948 -0.02240508 0.05429603 -0.03529709  1.00000000  0.99064965
# distance  -0.01413373 -0.02168090 0.04718917 -0.06186776  0.99064965  1.00000000

# We can display it visually to get a better understanding of the data
corrplot.mixed(cor_mat, lower = "circle", upper = "ellipse")

# save it to disk
png('corrplot.png')
corrplot.mixed(cor_mat, lower = "circle", upper = "ellipse")
dev.off()
