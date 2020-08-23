####Polynomial Linear Regression####
#Calling the data
dataset <- read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Calling the libraries and slitting the data into a training set and a test set
library(caTools)
 set.seed(123)
# View(dataset)
#    split = sample.split(dataset$Profit, SplitRatio = 0.8)
#    training_set = subset(dataset, split == TRUE)
#    test_set = subset(dataset, split == FALSE)
 
# Fitting Linear Regression to the dataset
 lin_reg = lm(formula = Salary~.,
              data = dataset)
 # Fitting Polynomial Regression to the dataset
  dataset$Level2 = dataset$Level^2
  dataset$Level3 = dataset$Level^3
  dataset$Level4 = dataset$Level^4
  
  poly_reg = lm(formula = Salary~.,
               data = dataset)
  
# Visualising the linear regression model results
# install.packages('ggplot2')
  library(ggplot2)
  ggplot() +
    geom_point(aes(x = dataset$Level,y = dataset$Salary),
               colour = 'red')+
    geom_line(aes(x = dataset$Level,y = predict(lin_reg, newdata = dataset)),
              colour = 'blue')+
    ggtitle('Truth or Bluff (Linear Regression)')+
    xlab('Level')+
    ylab('Salary')
#Visualising the polynomial regression model results
  ggplot() +
    geom_point(aes(x = dataset$Level,y = dataset$Salary),
               colour = 'red')+
    geom_line(aes(x = dataset$Level,y = predict(poly_reg, newdata = dataset)),
              colour = 'blue')+
    ggtitle('Truth or Bluff (Polynomial Regression)')+
    xlab('Level')+
    ylab('Salary')
  
  #Predict a result with Linear Regression Model
  y_linpred = predict(lin_reg, data.frame(Level = 6.5))
  y_linpred
  #Predict a result with Polynomial Regression Model
  y_polypred = predict(poly_reg, data.frame(Level = 6.5,
                                            Level2 = 6.5^2,
                                            Level3 = 6.5^3,
                                            Level4 = 6.5^4))
  y_polypred
  