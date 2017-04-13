# Read the predictions
preds = fread('vw/predictions.txt')

# Define the sigmoid function
sigmoid = function(x){
  1 / (1 + exp(-x))
}
probs = sigmoid(preds[[1]])

# Generate class labels
preds = ifelse(probs > 0.5, 1, 0)
head(preds)
# [1] 0 1 0 0 1 0
