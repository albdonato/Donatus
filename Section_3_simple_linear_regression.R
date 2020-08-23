dataset = read.csv('Salary_Data.csv')


#Splitting the Data into a Training set and a Test set
install.packages(caTools)
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting a simple linear regression
regressor=lm(formula=Salary~YearsExperience,
                data=training_set)
summary(regressor)

#Predict the test set results
y_pred = predict(regressor, newdata = test_set)
y_predt = predict(regressor, newdata = training_set)
ts.plot(y_pred)

#Visualizing multiple training set results 
install.packages("ggplot2")
library(ggplot2)
ggplot()+
  geom_point(aes(x= training_set$YearsExperience, y = training_set$Salary),
             colour='green') +
  geom_line(aes(x = training_set$YearsExperience,y = y_predt),
            colour = 'blue')+
  ggtitle('Salary vs Experience (training_set) ')+
  xlab('Years of Experience')+
  ylab('Salary')

ggplot()+
  geom_point(aes(x= test_set$YearsExperience, y = test_set$Salary),
             colour='green') +
  geom_line(aes(x = training_set$YearsExperience,y = y_predt),
            colour = 'blue')+
  ggtitle('Salary vs Experience (test_set) ')+
  xlab('Years of Experience')+
  ylab('Salary')
  