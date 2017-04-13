rm(list = ls(all = TRUE)); gc()

library(twitteR)
Sys.setlocale(category = "LC_ALL", locale = "C")

# Replace here the values you got from the twitter dev page as explained in the instructions
# consumer_key = "xxxxxxxxxxxxxxxxxxxx"
# consumer_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# access_token = "xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# access_token_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# Connect to twitter rest API
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_token_secret)

# Get tweets related to big mac
tweets <- searchTwitter('big mac', n=200, lang='en')
df <- twListToDF(tweets)

# Take a look at the data
head(df)

# see which device is most used
sources <- sapply(tweets, function(x) x$getStatusSource())
sources <- gsub("</a>", "", sources)
sources <- strsplit(sources, ">")
sources <- sapply(sources, function(x) ifelse(length(x) > 1, x[2], x[1]))
source_table = table(sources)
source_table = source_table[source_table > 1]
freq = source_table[order(source_table, decreasing=T)]
as.data.frame(freq)

#                   Frequency
# Twitter for iPhone       71
# Twitter for Android      29
# Twitter Web Client       25
# recognia                 20

