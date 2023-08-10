# Salary Influence Analysis

## Introduction

The subject of salaries has drawn significant attention from researchers, legal authorities, and practitioners. Understanding the factors influencing salaries is crucial for organizations as compensation issues are a key component of the employment contract. This report aims to identify the factors contributing to worker salaries, specifically focusing on education levels, experience, gender, location, and age. The analysis uses various statistical methods and is implemented in R using the "olsrr" package.
Analysis & Results
Data Description

The dataset contains information on the following variables for 15 workers:

    Salary: Numeric variable representing the salaries of workers.
    Education: Numeric variable representing the education levels of workers (1: NCE(Nigeria Certificate in Education), 2: Bsc(Bachelor of Sciences), 3: (Master of Science), 4: (Ph.D.)).
    Gender: Numeric variable representing the gender of workers (1: Male, 2: Female).
    Experience: Numeric variable representing the years of experience of workers.
    Age: Numeric variable representing the age of workers.
    Location: Numeric variable representing the location of workers (1: Urban, 2: Rural).
    
Discover the impact of education, experience, gender, location, and age on salaries with a Regression Analysis mini-project. Explore diverse statistical techniques and findings in this repository, designed for a comprehensive class exploration of compensation dynamics.
This repository contains an analysis of factors influencing worker salaries using different regression methods. The analysis is performed in R using the "olsrr" package and includes:

- All possible subsets regression
- Stepwise forward regression
- Stepwise backward regression
- Stepwise regression

### Create a data frame with the provided data
    Salary <- c(30,33,45,105,205,65,160,405,25,33,40,15,85,225,120)
    Education <- c(1,2,3,2,4,1,4,4,1,2,2,1,3,2,2)
    Experience <- c(5,2,6,1,10,2,9,16,10,1,2,3,6,1,3)
    Gender <- c(1,2,1,1,1,1,1,2,1,2,1,1,2,2,2)
    Location <- c(2,1,1,2,2,2,2,2,1,1,1,2,2,2,2)
    Age <- c(35,27,29,32,40,45,36,45,35,23,25,28,27,24,28)
    data <- data.frame(Salary, Education, Gender, Experience, Age, Location)

This part of the code creates a data frame called data with the provided data on salaries, education, experience, gender, location, and age of some workers.


### Create a linear regression model with Salary as the dependent variable and Education, Gender, Experience, Location, and Age as independent variables
    model <- lm(Salary ~ Education + Gender + Experience + Location + Age, data = data)

This part of the code uses the lm() function to create a linear regression model (model) with Salary as the dependent variable and Education, Gender, Experience, Location, and Age as the independent variables, using the data from the data data frame.



### Print summary statistics of the model
    summary(aov(model))
    summary(model)

These lines of code provide summary statistics for the model using the summary() function. The aov() function is used to calculate an analysis of variance (ANOVA) table for the model, and the summary() function is used to display the detailed summary of the linear regression model.



### Load the 'olsrr' package
    library(olsrr)

This line of code loads the olsrr package, which contains functions for regression analysis and diagnostics.


### Create a data frame with the results of all possible subset regression
     a <- data.frame(ols_step_all_possible(model))

This line of code uses the ols_step_all_possible() function from the olsrr package to perform all possible subset regression on the model and stores the results in a data frame called a.



### Save the results to a CSV file
     write.csv(a, "All possible.csv")

This line of code saves the data frame to a CSV file named "All possible.csv" in the current working directory.



### Perform stepwise forward regression
    c <- ols_step_forward_p(model, details = TRUE, penter = 0.1)

This line of code uses the ols_step_forward_p() function from the olsrr package to perform stepwise forward regression on the model with a significance level (p-value) of 0.1, and the results are stored in a data frame called c.


### Perform stepwise backward regression
    ols_step_backward_p(model, details = TRUE, progress = TRUE, prem = 0.15)

This line of code uses the ols_step_backward_p() function from the olsrr package to perform stepwise backward regression on the model with a significance level (p-value) of 0.15. The details = TRUE argument displays detailed information about the stepwise process, and progress = TRUE shows the progress of the regression.



### Perform stepwise regression (both forward and backward)
    ols_step_both_p(model, details = TRUE, pent = 0.15, prem = 0.15)

This line of code uses the ols_step_both_p() function from the olsrr package to perform stepwise regression (both forward and backward) on the model with a significance level (p-value) of 0.15 for both entering and removing variables. The details = TRUE argument displays detailed information about the stepwise process.

