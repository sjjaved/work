# Install the sqldf package
install.packages('sqldf')

# load the library
library('sqldf')
library(nycflights13)

# We will be working with the fligths dataset in order to introduce SQL

# Let's take a look at the table
str(flights)
# Classes ???tbl_df???, ???tbl??? and 'data.frame':	336776 obs. of  16 variables:
# $ year     : int  2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 ...
# $ month    : int  1 1 1 1 1 1 1 1 1 1 ...
# $ day      : int  1 1 1 1 1 1 1 1 1 1 ...
# $ dep_time : int  517 533 542 544 554 554 555 557 557 558 ...
# $ dep_delay: num  2 4 2 -1 -6 -4 -5 -3 -3 -2 ...
# $ arr_time : int  830 850 923 1004 812 740 913 709 838 753 ...
# $ arr_delay: num  11 20 33 -18 -25 12 19 -14 -8 8 ...
# $ carrier  : chr  "UA" "UA" "AA" "B6" ...
# $ tailnum  : chr  "N14228" "N24211" "N619AA" "N804JB" ...
# $ flight   : int  1545 1714 1141 725 461 1696 507 5708 79 301 ...
# $ origin   : chr  "EWR" "LGA" "JFK" "JFK" ...
# $ dest     : chr  "IAH" "IAH" "MIA" "BQN" ...
# $ air_time : num  227 227 160 183 116 150 158 53 140 138 ...
# $ distance : num  1400 1416 1089 1576 762 ...
# $ hour     : num  5 5 5 5 5 5 5 5 5 5 ...
# $ minute   : num  17 33 42 44 54 54 55 57 57 58 ...

### SELECT statement
ej1 = sqldf("
  SELECT 
    dep_time
    ,dep_delay
    ,arr_time
    ,carrier
    ,tailnum
  FROM
    flights")

head(ej1)
#   dep_time dep_delay arr_time carrier tailnum
# 1      517         2      830      UA  N14228
# 2      533         4      850      UA  N24211
# 3      542         2      923      AA  N619AA
# 4      544        -1     1004      B6  N804JB
# 5      554        -6      812      DL  N668DN
# 6      554        -4      740      UA  N39463

# In R we can use SQL with the sqldf function. It works exactly the same as in a database
# The data.frame (in this case flights) represents the table we are querying and goes in the FROM statement

# We can also compute new variables in the select statement using the syntax:
# old_variables as new_variable
ej2 = sqldf("
  SELECT
    arr_delay - dep_delay as gain,
    carrier
  FROM
    flights")

ej2[1:5, ]
#   gain carrier
# 1    9      UA
# 2   16      UA
# 3   31      AA
# 4  -17      B6
# 5  -19      DL




