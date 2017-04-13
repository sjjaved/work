
# Let's create a data.frame
df = data.frame(numbers=1:26, letters)
head(df)
#   numbers letters
# 1       1       a
# 2       2       b
# 3       3       c
# 4       4       d
# 5       5       e
# 6       6       f
# str gives the structure of a data.frame, it's a good summary to inspect an object
str(df)
# 'data.frame':	26 obs. of  2 variables:
#   $ numbers: int  1 2 3 4 5 6 7 8 9 10 ...
#   $ letters: Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...

# The latter shows the letters character vector was coerced as a factor.
# This can be explained by the stringsAsFactors = TRUE argumnet in data.frame
# read ?data.frame for more information

class(df)
# [1] "data.frame"

### Indexing

# Get the first row
df[1, ]
#   numbers letters
# 1       1       a

# Used for programming normally - returns the output as a list
df[1, , drop = TRUE]
# $numbers
# [1] 1
# 
# $letters
# [1] a
# Levels: a b c d e f g h i j k l m n o p q r s t u v w x y z


# Get several rows of the data.frame
df[5:7, ]
#   numbers letters
# 5       5       e
# 6       6       f
# 7       7       g

### Add one column that mixes the numeric column with the factor column
df$mixed = paste(df$numbers, df$letters, sep='')

str(df)
# 'data.frame':	26 obs. of  3 variables:
#   $ numbers: int  1 2 3 4 5 6 7 8 9 10 ...
# $ letters: Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ mixed  : chr  "1a" "2b" "3c" "4d" ...

### Get columns

# Get the first column
df[, 1]

# It returns a one dimensional vector with that column

# Get two columns
df2 = df[, 1:2]
head(df2)

#   numbers letters
# 1       1       a
# 2       2       b
# 3       3       c
# 4       4       d
# 5       5       e
# 6       6       f

# Get the first and third columns
df3 = df[, c(1, 3)]
df3[1:3, ]

#   numbers mixed
# 1       1    1a
# 2       2    2b
# 3       3    3c



### Index columns from their names
names(df)
# [1] "numbers" "letters" "mixed"  

# This is the best practise in programming, as many times indeces change, but variable names don't
# We create a variable with the names we want to subset
keep_vars = c("numbers", "mixed")
df4 = df[, keep_vars]

head(df4)
#   numbers mixed
# 1       1    1a
# 2       2    2b
# 3       3    3c
# 4       4    4d
# 5       5    5e
# 6       6    6f

### subset rows and columns

# Keep the first five rows
df5 = df[1:5, keep_vars]
df5
#   numbers mixed
# 1       1    1a
# 2       2    2b
# 3       3    3c
# 4       4    4d
# 5       5    5e


# subset rows using a logical condition
df6 = df[df$numbers < 10, keep_vars]
df6
#   numbers mixed
# 1       1    1a
# 2       2    2b
# 3       3    3c
# 4       4    4d
# 5       5    5e
# 6       6    6f
# 7       7    7g
# 8       8    8h
# 9       9    9i


