# Logistic Regression

# Importing the dataset
file = read.csv('C:/Users/Patron/Downloads/605 project/dataset.csv')
file = file[4:14]
drop <- c('totalMean', 'prev_temp')
drop <- c('PRCP')
dataset= file[,!(names(file)%in%drop)]
dataset = file[['TOBS', 'TMAX', 'TMIN', 'SNOW', 'SNWD', 'TOBS_is_overheated', 'TMAX_is_overheated', 'TMIN_is_overheated']]
#dataset = file[['TOBS', 'TMAX', 'TMIN', 'TOBS_is_overheated', 'TMAX_is_overheated', 'TMIN_is_overheated']]
head(dataset)
attach(dataset)

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)

splitmin = sample.split(dataset$TMIN_is_overheated, SplitRatio = 0.8)
splitmax = sample.split(dataset$TMAX_is_overheated, SplitRatio = 0.8)
splitobs = sample.split(dataset$TOBS_is_overheated, SplitRatio = 0.8)


training_set_min = subset(dataset, splitmin == TRUE)
test_set_min = subset(dataset, splitmin == FALSE)

training_set_max = subset(dataset, splitmax == TRUE)
test_set_max = subset(dataset, splitmax == FALSE)

training_set_obs = subset(dataset, splitobs == TRUE)
test_set_obs = subset(dataset, splitobs == FALSE)

# Feature Scaling
training_set_min[1:5] = scale(training_set_min[1:5])
test_set_min[1:5] = scale(test_set_min[1:5])

training_set_max[1:5] = scale(training_set_max[1:5])
test_set_max[1:5] = scale(test_set_max[1:5])

training_set_obs[1:5] = scale(training_set_obs[1:5])
test_set_obs[1:5] = scale(test_set_obs[1:5])


# Fitting Logistic Regression to the Training set
#classifier_min = glm(formula = TMIN_is_overheated ~TOBS + TMAX+ TMIN + PRCP+ SNOW+ SNWD , family = binomial, data = training_set_min)
#classifier_max = glm(formula = TMAX_is_overheated ~TOBS + TMAX+ TMIN + PRCP+ SNOW+ SNWD , family = binomial, data = training_set_max)
#classifier_obs = glm(formula = TOBS_is_overheated ~TOBS + TMAX+ TMIN + PRCP+ SNOW+ SNWD , family = binomial, data = training_set_obs)

classifier_min = glm(formula = TMIN_is_overheated ~TOBS + TMAX+ TMIN+ SNOW+ SNWD , family = binomial, data = training_set_min)
classifier_max = glm(formula = TMAX_is_overheated ~TOBS + TMAX+ TMIN+ SNOW+ SNWD , family = binomial, data = training_set_max)
classifier_obs = glm(formula = TOBS_is_overheated ~TOBS + TMAX+ TMIN+ SNOW+ SNWD , family = binomial, data = training_set_obs)

# Predicting the Test set results
prob_pred_min = predict(classifier_min, type = 'response', newdata = test_set_min)
y_pred_min = ifelse(prob_pred_min > 0.5, 1, 0)

prob_pred_max = predict(classifier_max, type = 'response', newdata = test_set_max)
y_pred_max = ifelse(prob_pred_max > 0.5, 1, 0)

prob_pred_obs = predict(classifier_obs, type = 'response', newdata = test_set_obs)
y_pred_obs = ifelse(prob_pred_obs > 0.5, 1, 0)

# Making the Confusion Matrix
cm_min = table(test_set_min[, 8], y_pred_min > 0.5)
accuracy_min= (cm_min[1]+cm_min[4])/sum(cm_min)
cm_max = table(test_set_max[, 8], y_pred_max > 0.5)
accuracy_max= (cm_max[1]+cm_max[4])/sum(cm_max)
cm_obs = table(test_set_obs[, 8], y_pred_obs > 0.5)
accuracy_obs= (cm_obs[1]+cm_obs[4])/sum(cm_obs)

#accuracy of the model to correctly predict if Temperature Maximum/Minimum/Observed has been increased from the given dependent variables
head(accuracy_min)
head(accuracy_max)
head(accuracy_obs)

head(cm_obs)






