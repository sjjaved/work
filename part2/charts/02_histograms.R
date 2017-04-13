source('01_box_plots.R')

# We can plot histograms for each level of the cut factor variable using facet_grid
p = ggplot(diamonds, aes(x=price, fill=cut)) +
  geom_histogram() +
  facet_grid(cut ~ .) +
  theme_bw()
p

# the previous plot doesn't allow to visuallize correctly the data because of the differences in scale
# we can turn this off using the scales argument of facet_grid

p = ggplot(diamonds, aes(x=price, fill=cut)) +
  geom_histogram() +
  facet_grid(cut ~ ., scales='free') +
  theme_bw()
p

png('02_histogram_diamonds_cut.png')
print(p)
dev.off()


