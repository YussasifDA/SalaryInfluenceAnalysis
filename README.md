# **SALARY INFLUENCE ANALYSIS**

*Disclaimer: The following report is intended solely for academic purposes to showcase a demonstration of statistical modeling. The data and results presented are entirely fictional and do not reflect any real-world scenarios or actual data.*

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

## Analysis & Results

In this section, we conduct an analysis on six variables: salary, education, gender, experience, age, and location. We consider salary as the dependent variable and education, gender, experience, age, and location as the independent variables. The statistical tool used for analysis is R, and we utilize the "olsrr" package in R.


### Create a data frame with the provided data
    Salary <- c(30,33,45,105,205,65,160,405,25,33,40,15,85,225,120)
    Education <- c(1,2,3,2,4,1,4,4,1,2,2,1,3,2,2)
    Experience <- c(5,2,6,1,10,2,9,16,10,1,2,3,6,1,3)
    Gender <- c(1,2,1,1,1,1,1,2,1,2,1,1,2,2,2)
    Location <- c(2,1,1,2,2,2,2,2,1,1,1,2,2,2,2)
    Age <- c(35,27,29,32,40,45,36,45,35,23,25,28,27,24,28)
    data <- data.frame(Salary, Education, Gender, Experience, Age, Location)

This part of the code creates a data frame called data with the provided data on salaries, education, experience, gender, location, and age of some workers.

The data used for the analysis is as follows in csv format:
![Data](/data.csv)


### Create a linear regression model with Salary as the dependent variable and Education, Gender, Experience, Location, and Age as independent variables
    model <- lm(Salary ~ Education + Gender + Experience + Location + Age, data = data)
    
Full Model:

The full model with all independent variables is given by:

Salary = 344.296 + 36.791(Education) + 81.340(Gender) + 4.399(Experience) + 4.080(Age) + 60.12(Location) + £i

This part of the code uses the lm() function to create a linear regression model (model) with Salary as the dependent variable and Education, Gender, Experience, Location, and Age as the independent variables, using the data from the data data frame.



### Print summary statistics of the model
    summary(aov(model))
    summary(model)

These lines of code provide summary statistics for the model using the summary() function. The aov() function is used to calculate an analysis of variance (ANOVA) table for the model, and the summary() function is used to display the detailed summary of the linear regression model.

    > summary(aov(model))
                Df Sum Sq Mean Sq F value Pr(>F)   
    Education    1  72858   72858  18.183 0.0021 **
    Gender       1   8567    8567   2.138 0.1777   
    Experience   1  15108   15108   3.771 0.0841 . 
    Location     1  21091   21091   5.263 0.0474 * 
    Age          1   4264    4264   1.064 0.3292   
    Residuals    9  36063    4007                  
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    > summary(model)
    
    Call:
    lm(formula = Salary ~ Education + Gender + Experience + Location + 
    Age, data = data)

    Residuals:
     Min       1Q   Median       3Q      Max 
    -100.577  -25.199   -7.271   21.692  110.453 

    Coefficients:
                Estimate  Std. Error t value Pr(>|t|)  
    (Intercept) -344.296    128.439  -2.681   0.0252 *
    Education     36.791     20.911   1.759   0.1124  
    Gender        81.340     37.895   2.146   0.0604 .
    Experience     4.399      6.701   0.657   0.5279  
    Location      60.126     40.683   1.478   0.1736  
    Age            4.080      3.955   1.032   0.3292  
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 63.3 on 9 degrees of freedom
    Multiple R-squared:  0.7717,	Adjusted R-squared:  0.6448 
    F-statistic: 6.084 on 5 and 9 DF,  p-value: 0.009859

In the ANOVA table:

Education has a low p-value (0.0021), indicating that it is significantly associated with the response variable (Salary).

Gender has a relatively higher p-value (0.1777), suggesting that its association with Salary might not be statistically significant.

Experience has a moderately high p-value (0.0841), indicating that its association with Salary might also not be significant.

Location has a p-value of 0.0474, which is below the common significance threshold of 0.05, suggesting a significant association.

Age has a high p-value (0.3292), indicating that it may not be significantly associated with Salary.

Linear Regression:
The second part of the output provides the coefficient estimates, standard errors, t-values, and p-values for the linear regression model. This part helps you understand the individual effects of each predictor on the response variable.

In the regression model:


The intercept term is estimated to be -344.296 with a p-value of 0.0252, suggesting it might be significant.

Education has a coefficient of 36.791 with a p-value of 0.1124, indicating it might not be significant.

Gender has a coefficient of 81.340 with a p-value of 0.0604, suggesting a potential significance at a 10% level.

Experience, Location, and Age also have their coefficient estimates, standard errors, t-values, and p-values listed.

Additionally, the multiple R-squared value (0.7717) indicates that the model as a whole explains about 77.17% of the variability in the response variable. The Adjusted R-squared (0.6448) takes into account the number of predictors and is often a better indicator of the model's goodness of fit when comparing models with different numbers of predictors.

In conclusion, the ANOVA and regression results suggest that Education, Location, and possibly Gender have significant associations with Salary, while Experience and Age may not have significant associations.

### Using the 'olsrr' package
    library(olsrr)

This line of code loads the olsrr package, which contains functions for regression analysis and diagnostics.


### Create a data frame with the results of all possible subset regression
     a <- data.frame(ols_step_all_possible(model))

This line of code uses the ols_step_all_possible() function from the olsrr package to perform all possible subset regression on the model and stores the results in a data frame called a.


### Save the results to a CSV file
     write.csv(a, "All possible.csv")

This line of code saves the data frame to a CSV file named "All possible.csv" in the current working directory.

Here's the result in csv format: ![All Possible Subset](/All possible.csv)



### Perform stepwise forward regression
    c <- ols_step_forward_p(model, details = TRUE, penter = 0.1)

This line of code uses the ols_step_forward_p() function from the olsrr package to perform stepwise forward regression on the model with a significance level (p-value) of 0.1, and the results are stored in a data frame called c.


### Perform stepwise backward regression
    ols_step_backward_p(model, details = TRUE, progress = TRUE, prem = 0.15)

This line of code uses the ols_step_backward_p() function from the olsrr package to perform stepwise backward regression on the model with a significance level (p-value) of 0.15. The details = TRUE argument displays detailed information about the stepwise process, and progress = TRUE shows the progress of the regression.



### Perform stepwise regression (both forward and backward)
    ols_step_both_p(model, details = TRUE, pent = 0.15, prem = 0.15)

This line of code uses the ols_step_both_p() function from the olsrr package to perform stepwise regression (both forward and backward) on the model with a significance level (p-value) of 0.15 for both entering and removing variables. The details = TRUE argument displays detailed information about the stepwise process.

