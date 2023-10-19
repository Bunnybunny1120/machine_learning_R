dataset <- read.csv(paste(getwd(), "/Life Expectancy Data.csv", sep = ""),
                    header = TRUE, sep = ",")

head(dataset,10)

 
set.seed(123)

train <- sample(seq_len(nrow(dataset)), 
               size = floor(0.70*nrow(dataset)))
train  <- dataset[train, ]

val<- sample(seq_len(nrow(dataset)), 
             size = floor(0.20*nrow(dataset)))
val<- dataset[val, ]

test<- sample(seq_len(nrow(dataset)), 
              size = floor(0.10*nrow(dataset)))
test<- dataset[test, ]

# 2. Divide dataset into training, validation and test data.
# 3. Build three linear regression models using the lm() function, 
# (m0, m1, and m2), m0 is the baseline
# and contains no predictors/features (called also an intercept-only model), 
# m1 and m2 should have a
# different number of predictors/features.
# 4. Evaluate three models appropriately (using MSE).
library(rsq)
#Training Dataset

m0_training <- lm(Life_expect~1 ,data = train)

m1_training <- lm(Life_expect~Alcohol+HepatitisB+Measles+BMI+Polio+Diphtheria +infant_deaths+percentage_expenditure+under_five_deaths+
                    Total_expenditure+GDP+Population+Income_composition_of_resources,
         data = train)

m2_training <- lm(Life_expect ~ GDP+BMI+Polio+infant_deaths+percentage_expenditure+under_five_deaths+
                    Total_expenditure+Population+Income_composition_of_resources, data = train)

# get MSE from three models
Train_MSE_M0 <- round(mean(m0_training$residuals^2),2)
Train_MSE_M1 <- round(mean(m1_training$residuals^2),2)
Train_MSE_M2 <- round(mean(m2_training$residuals^2),2) 

# Create a data frame for training MSE and R2

Train_MSE <- c(Train_MSE_M0, Train_MSE_M1, Train_MSE_M2)
Train_R2 <- c(round(rsq(m0_training), 2), round(rsq(m1_training), 2), round(rsq(m2_training), 2))

model_names <-c("M0", "M1", "M2")
combined_data <- data.frame(Model = model_names, Train_MSE, Train_R2)
  
combined_data

######################################################################
#Validation Dataset
m0_vali <- lm(Life_expect~1 ,data = val)

m1_vali <- lm(Life_expect~Alcohol+HepatitisB+Measles+BMI+Polio+Diphtheria +infant_deaths+percentage_expenditure+under_five_deaths+
                Total_expenditure+GDP+Population+Income_composition_of_resources,
              data = val)

m2_vali <- lm(Life_expect ~ GDP+BMI+Polio+infant_deaths+percentage_expenditure+under_five_deaths+
                Total_expenditure+Population+Income_composition_of_resources, data = val)

# get MSE from three models
Val_MSE_M0 <- round(mean(m0_vali$residuals^2),2)
Val_MSE_M1 <- round(mean(m1_vali$residuals^2),2)
Val_MSE_M2 <- round(mean(m2_vali$residuals^2),2) 


Val_MSE <- c(Val_MSE_M0, Val_MSE_M1, Val_MSE_M2)
Val_R2 <- c(round(rsq(m0_vali), 2), round(rsq(m1_vali), 2), round(rsq(m2_vali), 2))

model_names <-c("M0", "M1", "M2")
combined_data2 <- data.frame(Model = model_names, Val_MSE, Val_R2)

combined_data2

#########################################################################
#test Dataset
m0_test <- lm(Life_expect~1 ,data = test)

m1_test <- lm(Life_expect~Alcohol+HepatitisB+Measles+BMI+Polio+Diphtheria +infant_deaths+percentage_expenditure+under_five_deaths+
                Total_expenditure+GDP+Population+Income_composition_of_resources,
              data = test)

m2_test <- lm(Life_expect ~GDP+BMI+Polio+infant_deaths+percentage_expenditure+under_five_deaths+
                Total_expenditure+Population+Income_composition_of_resources, data = test)


# get MSE from three models
test_MSE_M0 <- round(mean(m0_test$residuals^2),2)
test_MSE_M1 <- round(mean(m1_test$residuals^2),2)
test_MSE_M2 <- round(mean(m2_test$residuals^2),2) 

test_MSE <- c(test_MSE_M0, test_MSE_M1, test_MSE_M2)
test_R2 <- c(round(rsq(m0_test), 2), round(rsq(m1_test), 2), round(rsq(m2_test), 2))

model_names <-c("M0", "M1", "M2")
combined_data3 <- data.frame(Model = model_names, test_MSE,test_R2)
combined_data3

#####################################################################
# overview all the output 

model_names <-c("M0", "M1", "M2")
combined_data_final <- data.frame(Model = model_names, Train_MSE, Val_MSE, test_MSE, Train_R2,  Val_R2,test_R2)
combined_data_final
