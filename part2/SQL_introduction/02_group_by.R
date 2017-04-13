### GROUP BY

# Computing the average
ej3 = sqldf("
  SELECT
    avg(arr_delay) as mean_arr_delay,
    avg(dep_delay) as mean_dep_delay,
    carrier
  FROM
    flights
  GROUP BY
    carrier
")

#    mean_arr_delay mean_dep_delay carrier
# 1       7.3796692      16.725769      9E
# 2       0.3642909       8.586016      AA
# 3      -9.9308886       5.804775      AS
# 4       9.4579733      13.022522      B6
# 5       1.6443409       9.264505      DL
# 6      15.7964311      19.955390      EV
# 7      21.9207048      20.215543      F9
# 8      20.1159055      18.726075      FL
# 9      -6.9152047       4.900585      HA
# 10     10.7747334      10.552041      MQ
# 11     11.9310345      12.586207      OO
# 12      3.5580111      12.106073      UA
# 13      2.1295951       3.782418      US
# 14      1.7644644      12.869421      VX
# 15      9.6491199      17.711744      WN
# 16     15.5569853      18.996330      YV

# Other aggregations
ej4 = sqldf("
  SELECT
  avg(arr_delay) as mean_arr_delay,
  min(dep_delay) as min_dep_delay,
  max(dep_delay) as max_dep_delay,
  carrier
  FROM 
    flights
  GROUP BY
    carrier
")

# We can compute the minimun, mean, and maximum values of a numeric value
ej4
#    mean_arr_delay min_dep_delay max_dep_delay carrier
# 1       7.3796692           -24           747      9E
# 2       0.3642909           -24          1014      AA
# 3      -9.9308886           -21           225      AS
# 4       9.4579733           -43           502      B6
# 5       1.6443409           -33           960      DL
# 6      15.7964311           -32           548      EV
# 7      21.9207048           -27           853      F9
# 8      20.1159055           -22           602      FL
# 9      -6.9152047           -16          1301      HA
# 10     10.7747334           -26          1137      MQ
# 11     11.9310345           -14           154      OO
# 12      3.5580111           -20           483      UA
# 13      2.1295951           -19           500      US
# 14      1.7644644           -20           653      VX
# 15      9.6491199           -13           471      WN
# 16     15.5569853           -16           387      YV


### We could be also interested in knowing how many observations each carrier has

ej5 = sqldf("
  SELECT
  carrier, count(*) as count
  FROM 
    flights
  GROUP BY
    carrier
")

ej5
#    carrier count
# 1       9E 18460
# 2       AA 32729
# 3       AS   714
# 4       B6 54635
# 5       DL 48110
# 6       EV 54173
# 7       F9   685
# 8       FL  3260
# 9       HA   342
# 10      MQ 26397
# 11      OO    32
# 12      UA 58665
# 13      US 20536
# 14      VX  5162
# 15      WN 12275
# 16      YV   601
