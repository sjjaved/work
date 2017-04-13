library(nycflights13)
library(ggplot2)
library(data.table)
library(reshape2)

# Using the code from the previous section
# This computes the mean arrival and departure delays by carrier.
DT <- as.data.table(flights)
mean2 = DT[, list(mean_departure_delay=mean(dep_delay, na.rm=TRUE),
                  mean_arrival_delay=mean(arr_delay, na.rm=TRUE)),
           by = carrier]

# In order to plot data in R usign ggplot, it is normally needed to reshape the data
# We want to have the data in long format for plotting with ggplot
dt = melt(mean2, id.vars='carrier')

# Take a look at the first rows
print(head(dt))

# Take a look at the help for ?geom_point and geom_line to find similar examples
# Here we take the carrier code as the x axis
# the value from the dt data.table goes in the y axis
# The variable column represents the color
p = ggplot(dt, aes(x=carrier, y=value, color=variable, group=variable)) +
  geom_point() + # Plots points
  geom_line() + # Plots lines
  theme_bw() + # Uses a white background
  labs(list(title='Mean arrival and departure delay by carrier',
            x='Carrier', y='Mean delay'))
print(p)

# Save the plot to disk
ggsave('mean_delay_by_carrier.png', p, 
       width=10.4, height=5.07)
