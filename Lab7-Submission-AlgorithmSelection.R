# Consider a library as the location where packages are stored.
# Execute the following command to list all the libraries available in your
# computer:
.libPaths()
# One of the libraries should be a folder inside the project if you are using
# renv

# Then execute the following command to see which packages are available in
# each library:
lapply(.libPaths(), list.files)
# If renv::restore() did not install the "languageserver" package (required to
# use R for VS Code), then it can be installed manually as follows (restart R
# after executing the command):

if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
# STEP 1. Install and Load the Required Packages ----
## stats ----
if (require("stats")) {
  require("stats")
} else {
  install.packages("stats", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## MASS ----
if (require("MASS")) {
  require("MASS")
} else {
  install.packages("MASS", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## glmnet ----
if (require("glmnet")) {
  require("glmnet")
} else {
  install.packages("glmnet", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071 ----
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## kernlab ----
if (require("kernlab")) {
  require("kernlab")
} else {
  install.packages("kernlab", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## rpart ----
if (require("rpart")) {
  require("rpart")
} else {
  install.packages("rpart", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# A. Linear Algorithms ----
## 1.a Linear Regression ----
# STEP 2. Load the Dataset ----
##Speed and Stopping Distances of Cars dataset
data("cars")
# Define an 80:20 train:test data split
set.seed(123) # for reproducibility
train_index <- createDataPartition(cars$Mileage, p = 0.8, list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
cars_model_lm <- lm(Mileage ~ ., data = cars_train)

#### Display the model's details ----
print(cars_model_lm)

#### Make predictions ----
predictions <- predict(cars_model_lm, newdata = cars_test)

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

### 1.b. Linear Regression using Ordinary Least Squares with caret ----
#### Load and split the dataset ----
data("cars")

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.8,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
cars_caret_model_lm <- train(Mileage ~ ., data = cars_train,
                                       method = "lm", metric = "RMSE",
                                       preProcess = c("center", "scale"),
                                       trControl = train_control)

#### Display the model's details ----
print(cars_caret_model_lm)

#### Make predictions ----
predictions <- predict(cars_caret_model_lm,
                       cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

## 2. Logistic Regression ----
### 2.a. Logistic Regression without caret ----
#### Load and split the dataset ----
data("cars")
# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.7,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
cars_model_glm <- glm(Saab ~ ., data = cars_train, family = binomial(link = "logit"), control = glm.control(maxit = 100))

#### Display the model's details ----
print(cars_model_glm)

#### Make predictions ----
probabilities <- predict(cars_model_glm, cars_test[, 1:18],
                         type = "response")
print(probabilities)
predictions <- ifelse(probabilities > 0.5, "pos", "neg")
print(predictions)


### 2.b. Logistic Regression with caret ----
#### Load and split the dataset ----
# Execute the following to load the downloaded Iris dataset:
iris_dataset <- read.csv("data/iris.data", header = FALSE,
                         stringsAsFactors = TRUE)
# This time, we name the attributes of the Iris Dataset as follows:
names(iris_dataset) <- c("sepal length in cm", "sepal width in cm",
                         "petal length in cm", "petal width in cm", "class")



# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris_dataset$class,
                                   p = 0.7,
                                   list = FALSE)
iris_dataset_train <- iris_dataset[train_index, ]
iris_dataset_test <- iris_dataset[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)
# We can use "regLogistic" instead of "glm"
# Notice the data transformation applied when we call the train function
# in caret, i.e., a standardize data transform (centre + scale)
set.seed(7)
iris_dataset_caret_model_logistic <-
  train(class ~ ., data = iris_dataset_train,
        method = "regLogistic", metric = "Accuracy",
        preProcess = c("center", "scale"), trControl = train_control)

#### Display the model's details ----
print(iris_dataset_caret_model_logistic)

#### Make predictions ----
predictions <- predict(iris_dataset_caret_model_logistic,
                       iris_dataset_test[, 1:5])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_dataset_test[, 1:5]$class)
print(confusion_matrix)


## 3. Linear Discriminant Analysis ----
### 3.a. Linear Discriminant Analysis without caret ----

#### Load and split the dataset ----
data("esoph")
# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(esoph$tobgp,
                                   p = 0.7,
                                   list = FALSE)
esoph_train <- esoph[train_index, ]
esoph_test <- esoph[-train_index, ]

#### Train the model ----
esoph_model_lda <- lda(tobgp ~ ., data = esoph_train)

#### Display the model's details ----
print(esoph_model_lda)

#### Make predictions ----
predictions <- predict(esoph_model_lda,
                       esoph_test[, 1:5])$class

#### Display the model's evaluation metrics ----
table(predictions, esoph_test$tobgp)
### 3.b.  Linear Discriminant Analysis with caret ----
#### Load and split the dataset ---
data("esoph")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(esoph$tobgp,
                                   p = 0.7,
                                   list = FALSE)
esoph_train <- esoph[train_index, ]
esoph_test <- esoph[-train_index, ]

#### Train the model ----
set.seed(7)

# We apply a Leave One Out Cross Validation resampling method
train_control <- trainControl(method = "LOOCV")
# We also apply a standardize data transform to make the mean = 0 and
# standard deviation = 1
esoph_caret_model_lda <- train(tobgp ~ .,
                                  data = esoph_train,
                                  method = "lda", metric = "Accuracy",
                                  preProcess = c("center", "scale"),
                                  trControl = train_control)

#### Display the model's details ----
print(esoph_caret_model_lda)

#### Make predictions ----
predictions <- predict(esoph_caret_model_lda,
                       esoph_test[, 1:5])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         esoph_test[, 1:5]$tobgp)
print(confusion_matrix)
## 4. Regularized Linear Regression ----
### 4.a. Regularized Linear Regression Classification Problem without CARET ----
#### Load the dataset ----
data("iris")
x <- as.matrix(iris[, 1:4])
y <- as.matrix(iris[, 5])

#### Train the model ----
iris_model_glm <- glmnet(x, y, family = "multinomial", alpha = 0.5, lambda = 0.001)

#### Display the model's details ----
print(iris_model_glm)

#### Make predictions ----
predictions <- predict(iris_model_glm, x, type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris$Species)

### 4.b. Regularized Linear Regression Regression Problem without CARET ----
#### Load the dataset ----
data("ChickWeight")
ChickWeight$chas <- # nolint: object_name_linter.
  as.numeric(as.character(ChickWeight$weight))
x <- as.matrix(ChickWeight[, 1:3])
y <- as.matrix(ChickWeight[, 5])

#### Train the model ----
ChickWeight_model_glm <- glmnet(x, y, family = "gaussian",
                                   alpha = 0.5, lambda = 0.001)

#### Display the model's details ----
print(ChickWeight_model_glm)

#### Make predictions ----
predictions <- predict(ChickWeight_model_glm, x, type = "link")

#### Display the model's evaluation metrics ----
mse <- mean((y - predictions)^2)
print(mse)
##### RMSE ----
rmse <- sqrt(mean((y - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
ssr <- sum((y - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
sst <- sum((y - mean(y))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
absolute_errors <- abs(predictions - y)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
### 4.c. Regularized Linear Regression Classification Problem with CARET ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
iris_caret_model_glmnet <-
  train(Species ~ ., data = iris_train,
        method = "glmnet", metric = "Accuracy",
        preProcess = c("center", "scale"), trControl = train_control)

#### Display the model's details ----
print(iris_caret_model_glmnet)

#### Make predictions ----
predictions <- predict(iris_caret_model_glmnet,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

### 4.d. Regularized Linear Regression Regression Problem with CARET ----
#### Load and split the dataset ----
data("cars")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.7,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
cars_caret_model_glmnet <-
  train(Mileage ~ .,
        data = cars_train, method = "glmnet",
        metric = "RMSE", preProcess = c("center", "scale"),
        trControl = train_control)

#### Display the model's details ----
print(cars_caret_model_glmnet)

#### Make predictions ----
predictions <- predict(cars_caret_model_glmnet, cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----

absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

# B. Non-Linear Algorithms ----
## 1.  Classification and Regression Trees ----
### 1.a. Decision tree for a classification problem without caret ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
Species_model_rpart <- rpart(Species ~ ., data = iris_train)

#### Display the model's details ----
print(Species_model_rpart)

#### Make predictions ----
predictions <- predict(Species_model_rpart,
                       iris_test[, 1:4],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris_test$Species)

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)



### 1.b. Decision tree for a regression problem without CARET ----
#### Load and split the dataset ----
data("cars")

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.8,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
cars_model_cart <- rpart(Mileage ~ ., data = cars_train,
                            control = rpart.control(minsplit=5))

#### Display the model's details ----
print(cars_model_cart)

#### Make predictions ----
predictions <- predict(cars_model_cart, cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
### 1.c. Decision tree for a classification problem with caret ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
set.seed(7)
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)
Species_caret_model_rpart <- train(Species ~ ., data = iris,
                                    method = "rpart", metric = "Accuracy",
                                    trControl = train_control)

#### Display the model's details ----
print(Species_caret_model_rpart)

#### Make predictions ----
predictions <- predict(Species_model_rpart,
                       iris_test[, 1:4],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris_test$Species)

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)



### 1.d. Decision tree for a regression problem with CARET ----
#### Load and split the dataset ----
data("cars")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.7,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
set.seed(7)
# 7 fold repeated cross validation with 3 repeats
train_control <- trainControl(method = "repeatedcv", number = 5, repeats = 3)

cars_caret_model_cart <- train(Mileage ~ ., data = cars,
                                  method = "rpart", metric = "RMSE",
                                  trControl = train_control)

#### Display the model's details ----
print(cars_caret_model_cart)

#### Make predictions ----
predictions <- predict(cars_caret_model_cart, cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----

absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

## 2.  Naïve Bayes ----
### 2.a. Naïve Bayes Classifier for a Classification Problem without CARET ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
Species_model_nb <- naiveBayes(Species ~ .,
                                data = iris_train)

#### Display the model's details ----
print(Species_model_nb)

#### Make predictions ----
predictions <- predict(Species_model_nb,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)



### 2.b. Naïve Bayes Classifier for a Classification Problem with CARET ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
Species_caret_model_nb <- train(Species ~ .,
                                 data = iris_train,
                                 method = "nb", metric = "Accuracy",
                                 trControl = train_control)

#### Display the model's details ----
print(Species_caret_model_nb)

#### Make predictions ----
predictions <- predict(Species_caret_model_nb,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)

## 3.  k-Nearest Neighbours ----
### 3.a. kNN for a classification problem without CARET's train function ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
Species_caret_model_knn <- knn3(Species ~ ., data = iris_train, k=3)

#### Display the model's details ----
print(Species_caret_model_knn)

#### Make predictions ----
predictions <- predict(Species_caret_model_knn,
                       iris_test[, 1:4],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris_test$Species)

# Or alternatively:
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test$Species)
print(confusion_matrix)



### 3.b. kNN for a regression problem without CARET's train function ----
#### Load the dataset ----
data("cars")
cars$Saturn <- # nolint: object_name_linter.
  as.numeric(as.character(cars$Saturn))
x <- as.matrix(cars[, 1:17])
y <- as.matrix(cars[, 2])

#### Train the model ----
cars_model_knn <- knnreg(x, y, k = 3)

#### Display the model's details ----
print(cars_model_knn)

#### Make predictions ----
predictions <- predict(cars_model_knn, x)

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((y - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
ssr <- sum((y - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
sst <- sum((y - mean(y))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
absolute_errors <- abs(predictions - y)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
### 3.c. kNN for a classification problem with CARET's train function ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
# We apply the 10-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 10)
Species_caret_model_knn <- train(Species ~ ., data = iris,
                                  method = "knn", metric = "Accuracy",
                                  preProcess = c("center", "scale"),
                                  trControl = train_control)

#### Display the model's details ----
print(Species_caret_model_knn)

#### Make predictions ----
predictions <- predict(Species_caret_model_knn,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)



### 3.d. kNN for a regression problem with CARET's train function ----
#### Load and split the dataset ----
data("cars")

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.8,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
cars_caret_model_knn <- train(Mileage ~ ., data = cars,
                                 method = "knn", metric = "RMSE",
                                 preProcess = c("center", "scale"),
                                 trControl = train_control)

#### Display the model's details ----
print(cars_caret_model_knn)

#### Make predictions ----
predictions <- predict(cars_caret_model_knn,
                       cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
# MAE is expressed in the same units as the target variable, making it easy to
# interpret. For example, if you are predicting the amount paid in rent,
# and the MAE is KES. 10,000, it means, on average, your model's predictions
# are off by about KES. 10,000.
absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))


