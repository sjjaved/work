# Install the following packages
# Pkg.clone("git://github.com/lepisma/ELM.jl.git");
# Pkg.clone("git://github.com/EricChiang/ANN.jl.git");

# Change the directory to the directory of analytics_book/bda/part2/data_analysis_tools
cd("$(homedir())/Desktop/dm/free/09_september/analytics_book/bda/part2/data_analysis_tools")

# Import neural networks julia packages
import ELM, ANN;
using DataFrames

# Read the data
dat = readtable("data_banknote_authentication.txt", header = false);
dat

# The fifth column is the class we are trying to predict
head(dat)

# For all four columns
for i in 1:4
    # Subtracting the mean and dividing by standard deviation
    dat[i] = (dat[i] - mean(dat[i])) / std(dat[i]);
end

# Split dataset in training and testing
n_test = int(length(dat[end]) * 0.2);
train_rows = shuffle([1:length(dat[end])] .> n_test);
dat_train, dat_test = dat[train_rows, :], dat[!train_rows, :];

# Define neural networks
#10 hidden neurons, single hidden layer
ann = ANN.ArtificialNeuralNetwork(10);

# Define extreme learning machine
#10 hidden neurons
elm = ELM.ExtremeLearningMachine(10);

### Compute accuracy of both models
# Accuracy for ANN
function accu(model::ANN.ArtificialNeuralNetwork,
                      x_test::Matrix{Float64},
                      y_test::Vector{Int64})

    outputs = ANN.predict(model, x_test);
    predictions = Array(Int64, length(y_test));

    for i in 1:length(y_test)
        predictions[i] = model.classes[indmax(outputs[i, :])];
    end

    mean(predictions .== y_test)
end

# Accuracy for ELM
function accu(model::ELM.ExtremeLearningMachine,
                         data_test::DataFrame)

    predictions = ELM.predict(model, data_test[1:end-1]);
    mean(int(predictions) .== data_test[end])
end

# Train both models
ANN.fit!(ann, array(dat_train[1:end-1]),
         array(dat_train[end]), epochs = 16, lambda = 1e-5)

accu(ann, array(dat_test[1:end-1]), array(dat_test[end]))

# Accuracy results
ELM.fit!(elm, dat_train[1:end-1], dat_train[end])
accu(elm, dat_test)