source('data_visualization.R')                                                                                                       

### Analizing Distributions using boxplots

# The following shows the distance as a function of the carrier
p = ggplot(DT, aes(x=carrier, y=distance, fill=carrier)) + # Define the carrier in the x axis and distance in the y axis
  geom_boxplot() + # Use the boxplot geom
  theme_bw() + # Leave a white background - More in line with tufte's principles than the default
  guides(fill=FALSE) + # Remove legend
  labs(list(title='Distance as a function of carrier', # Add labels
            x='Carrier', y='Distance'))
p 

# Save to disk
png('boxplot_carrier.png')
print(p)
dev.off()


# Let's add now another variable, the month of each flight
# We will be using facet_wrap for this
p = ggplot(DT, aes(carrier, distance, fill=carrier)) +
  geom_boxplot() +
  theme_bw() +
  guides(fill=FALSE) + 
  facet_wrap(~month) + # This creates the trellis plot with the by month variable
  labs(list(title='Distance as a function of carrier by month',
            x='Carrier', y='Distance'))
p 

# The plot shows there aren't clear differences between distance in different months

# Save to disk
png('boxplot_carrier_by_month.png')
print(p)
dev.off()


