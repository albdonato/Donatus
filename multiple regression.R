#Mutiple linear regression
dataset <- read.csv('50_Startups.csv')
#Splitting the Data into a Training set and a Test set
install.packages(caTools)
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Enconding categorical data
dataset$State = factor(dataset$State, levels=c('New York','California','Florida'),
                         labels = c(1,2,3))

#Fitting multiple linear regression in the traning test
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
#=====
  regressor = lm()
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
                 data = training_set)
summary(regressor)
regressor = lm(formula = Profit ~R.D.Spend, 
               data = training_set)
#predicting

y_pred = predict(regressor, newdata = test_set)
y_pred
