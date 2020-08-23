# Regression Template

#Importing the dataset
dataset <- read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Calling the libraries and slitting the data into a training set and a test set
library(caTools)
set.seed(123)
# View(dataset)
#    split = sample.split(dataset$Profit, SplitRatio = 0.8)
#    training_set = subset(dataset, split == TRUE)
#    test_set = subset(dataset, split == FALSE)

# Fitting the Regression model to the dataset
# Create your regressor here
# Install.packages('ggplot2')
library(ggplot2)

#Predict a result with Regression Model
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

#Visualising the regression model results
ggplot() +
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level,y = predict(regressor, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Truth or Bluff (Regression)')+
  xlab('Level')+
  ylab('Salary')

