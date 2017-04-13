### Evaluate the data types using type, class

### One dimensional objects
# Integer vector
num = 1:10
class(num)
# [1] "integer"

# Numeric vector, it has a float, 10.5
num = c(1:10, 10.5)
class(num)
# [1] "numeric"

# Character vector
ltrs = letters[1:10]
class(ltrs)
# [1] "character"

# Factor vector
fac = as.factor(ltrs)
class(fac)
# [1] "factor"

### Two dimensional objects

# Matrix
M = matrix(1:12, ncol=4)
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12
lM = matrix(letters[1:12], ncol=4)
#     [,1] [,2] [,3] [,4]
# [1,] "a"  "d"  "g"  "j" 
# [2,] "b"  "e"  "h"  "k" 
# [3,] "c"  "f"  "i"  "l" 

# Coerces the numbers to character
# cbind concatenates two matrices (or vectors) in one matrix
cbind(M, lM)
#     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
# [1,] "1"  "4"  "7"  "10" "a"  "d"  "g"  "j" 
# [2,] "2"  "5"  "8"  "11" "b"  "e"  "h"  "k" 
# [3,] "3"  "6"  "9"  "12" "c"  "f"  "i"  "l" 

class(M)
# [1] "matrix"
class(lM)
# [1] "matrix"

# data.frame
# One of the main objects of R, handles different data types in the same object. 
# It is possible to have numeric, character and factor vectors in the same data.frame

df = data.frame(n=1:5, l=letters[1:5])
df
#   n l
# 1 1 a
# 2 2 b
# 3 3 c
# 4 4 d
# 5 5 e




