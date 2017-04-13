source('collect_data_twitter.R')

# Some tweets
head(df$text)
# [1] "@rdryan33 @WingedWheels  I'd be ordering a Big Mac! Haha"                                                                                
# [2] "RT @Savito_BossDon: Only Thing I Need For Thanksgiving Is A Big Ass Plate Of Sweet Potatoes And Baked Mac And Cheese With A Few Slabs Of Tu???"             
# [3] "Never mess with a mans Big Mac  (Vine by @sport_fun_facts) https://t.co/6ThanEvBkG"      

### We are interested in the text - Let's clean it! 

# We first convert the encoding of the text from latin1 to ASCII
df$text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))

# Create a function to clean tweets
clean.text <- function(tx){
  tx <- gsub("htt.{1,20}", " ", tx, ignore.case=TRUE)
  tx = gsub("[^#[:^punct:]]|@|RT", " ", tx, perl=TRUE, ignore.case=TRUE)
  tx = gsub("[[:digit:]]", " ", tx, ignore.case=TRUE)
  tx = gsub(" {1,}", " ", tx, ignore.case=TRUE)
  tx = gsub("^\\s+|\\s+$", " ", tx, ignore.case=TRUE)
  return(tx)
}

clean_tweets <- lapply(df$text, clean.text)

head(clean_tweets)

