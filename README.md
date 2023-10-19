
# Project Description
This project was conducted in collaboration with three fellow classmates as part of a methodology course during my pre-master's studies. The objective was to define a research question using a dataset that contains at least 12 features.

 

# Dataset & Exploration

We used a dataset of life expectancy from Kaggle and inspected the data by its type and identified variables we were going to use.

 

# Research question
What will be the life expectancy based on economic and health parameters?

 

# Data Preprocessing, Models and Evaluation
The data were partitioned into Training (70%), Validation (20%), and Test (10%) sets.

We built three linear regression models using the lm() function: m0, m1, and m2.


Life expectancy is the target variable.

m0 serves as the baseline model and does not include any features (an intercept-only model).
m1 contains all 13 features.
m2 includes a subset of features (9)from m1 for model comparison.
 
Mean squared error scores (MSE scores) are used to provide insights into which regression model aligns the closest with the set of data points in the training and validation sets. R-squared (R2) helps us understand the proportion of variance explained by the model.

 

# Findings and Conclusion

![MSE and R2 from all the models](https://github.com/Bunnybunny1120/machine_learning_R/blob/main/output.png)

Baseline M0 has highest MSE, three times as much as the other two models.

M1 MSE: Train, Validation = 31.12, 27.91  R2: Train, Validation = 0.61, 0.67

M2 MSE: Train, Validation =34.10, 29.15  R2: Train, Validation = 0.66, 0.72


### M1:
Lower MSE on the validation dataset.
Slightly lower R2 values for both training and validation.

### M2:
Slightly higher MSE on the validation dataset.
Slightly higher R2 values for both training and validation.
 
Despite a lower MSE in M1, given that M2 uses fewer features and achieves slightly better R2 values for both training and validation, it appears to be the better model in this case. It provides a good balance between model simplicity and predictive performance, which can be more robust.
 
Underfitting of the data happens when the model does not have enough complexity to fit the data, this can be detected by looking for a high MSE on the training and validation sets. Lm0 has the highest MSE, making it under fitted relative to the other 2 models. M1 and M2 are slightly underfitted.


Overfitting of a model happens when a model is too complex for the data. The model will perform well on the training set, but will have a high error on the validation set. We do not see such an increase on the validation set and as such we can conclude that neither of our models are overfitting the data.

