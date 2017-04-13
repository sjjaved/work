library(tm)
library(data.table)

source('text_analytics/text_analytics_functions.R')
data = fread('text_analytics/data/profiles.txt')

rate = as.numeric(data$rate)
keep = !is.na(rate)
rate = rate[keep]

### Make bag of words of title and body
X_all = bag_words(data$user_skills[keep])
X_all = removeSparseTerms(X_all, 0.999)
X_all
# <<DocumentTermMatrix (documents: 389, terms: 1422)>>
#   Non-/sparse entries: 4057/549101
# Sparsity           : 99%
# Maximal term length: 80
# Weighting          : term frequency - inverse document frequency (normalized) (tf-idf)

### Make a sparse matrix with all the data
X_all <- as_sparseMatrix(X_all)

train_inx = 1:200
X_train = X_all[train_inx, ]
y_train = rate[train_inx]

X_test = X_all[-train_inx, ]
y_test = rate[-train_inx]

# Train a regression model
library(glmnet)
fit <- cv.glmnet(x=X_train, y=y_train, 
                 family='gaussian', alpha=1, 
                 nfolds=3, type.measure = 'mae')
plot(fit)

# Make predictions
predictions = predict(fit, newx=X_test)
predictions = as.vector(predictions[,1])
head(predictions)
# 36.23598 36.43046 51.69786 26.06811 35.13185 37.66367

# We can compute the mean absolute error for the test data
mean(abs(y_test - predictions))
# 15.02175

