# Let's create two tables: A and B to demonstrate joins.
A = data.frame(c1=1:4, c2=letters[1:4])
B = data.frame(c1=c(2,4,5,6), c2=letters[c(2:5)])

A
# c1 c2
# 1  a
# 2  b
# 3  c
# 4  d

B
# c1 c2
# 2  b
# 4  c
# 5  d
# 6  e

### INNER JOIN
# This means to match the observations of the column we would join the tables by. 

inner = sqldf("
  SELECT
   A.c1, B.c2
  FROM
   A INNER JOIN B
   ON A.c1 = B.c1
")

# Only the rows that match c1 in both A and B are returned
inner
# c1 c2
#  2  b
#  4  c

### LEFT OUTER JOIN
# the left outer join, sometimes just called left join will return the 
# first all the values of the column used from the A table

left = sqldf("
  SELECT
   A.c1, B.c2
  FROM
   A LEFT OUTER JOIN B
   ON A.c1 = B.c1
")

# Only the rows that match c1 in both A and B are returned
left
#   c1   c2
#    1 <NA>
#    2    b
#    3 <NA>
#    4    c



