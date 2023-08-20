# **SALARY INFLUENCE ANALYSIS**

## Table of contents
- [1.0    Introduction](#introduction)
- [2.0    Analysis & Results](#analysis-&-results)

*Disclaimer: The following report is intended solely for academic purposes to showcase a demonstration of statistical modeling. The data and results presented are entirely fictional and do not reflect any real-world scenarios or actual data.*

## 1.0    Introduction

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

## 2.0    Analysis & Results

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

### Linear Regression:
The second part of the output provides the coefficient estimates, standard errors, t-values, and p-values for the linear regression model. This part helps you understand the individual effects of each predictor on the response variable.

In the regression model:


The intercept term is estimated to be -344.296 with a p-value of 0.0252, suggesting it might be significant.

Education has a coefficient of 36.791 with a p-value of 0.1124, indicating it might not be significant.

Gender has a coefficient of 81.340 with a p-value of 0.0604, suggesting a potential significance at a 10% level.

Experience, Location, and Age also have their coefficient estimates, standard errors, t-values, and p-values listed.

Additionally, the multiple R-squared value (0.7717) indicates that the model as a whole explains about 77.17% of the variability in the response variable. The Adjusted R-squared (0.6448) takes into account the number of predictors and is often a better indicator of the model's goodness of fit when comparing models with different numbers of predictors.

In conclusion, the ANOVA and regression results suggest that Education, Location, and possibly Gender have significant associations with Salary, while Experience and Age may not have significant associations.

## 2.1    All Possible Subset
All subset regression tests all possible subsets of the set of potential independent variables. If there are P potential independent variables (besides the constant), then there are 2p-1 distinct subsets of them to be tested. Since we have 5 independent variables 2<sup>5</sup>-1, which is 31. Also selecting the best model based on certain criteria e.g. R<sup>2</sup>, R<sup>2</sup>adj, Cp, MSE. In this report, we’ll be using R<sup>2 </sup>, R<sup>2</sup>adj, Cp, and sqrt(MSE).

### Using the 'olsrr' package
    library(olsrr)

This line of code loads the olsrr package, which contains functions for regression analysis and diagnostics.


### Create a data frame with the results of all possible subset regression
     a <- data.frame(ols_step_all_possible(model))

This line of code uses the ols_step_all_possible() function from the olsrr package to perform all possible subset regression on the model and stores the results in a data frame called a.


### Save the results to a CSV file
     write.csv(a, "All possible.csv")

This line of code saves the data frame to a CSV file named "All possible.csv" in the current working directory.

Here's the result in csv format: ![All Possible Subset](/All_possible.csv)


## 2.2    Stepwise Forward Regression
Build a regression model from a set of predictor variables by entering predictors based on p-value into the null model, in a forward stepwise manner until there is no variable left to enter anymore. In this report we’re setting our αenter to be 0.15 for a variable to enter the model, i.e. the p-value of a particular variable has to be less than αenter=0.15.
Forward Selection: 
Null Model: Salary=β<sub>0</sub>+£<sub>i</sub>
Predictor Variables: Education, Gender, Experience, Location, Age

    c <- ols_step_forward_p(model, details = TRUE, penter = 0.1)

This line of code uses the ols_step_forward_p() function from the olsrr package to perform stepwise forward regression on the model with a significance level (p-value) of 0.1, and the results are stored in a data frame called c.

Here's the result from R-console and discussion:

    Forward Selection Method    
    ---------------------------

    Candidate Terms: 

    1. Education 
    2. Gender 
    3. Experience 
    4. Location 
    5. Age 

We are selecting variables based on p value...

In forward selection, variables are added to the model one by one based on their p-values, starting with the variable that has the lowest p-value. This process helps in selecting the most significant predictors for the model. Let's break down each step and the information it presents:

Forward Selection: Step 1 

    + Education 

                         Model Summary                           
    ----------------------------------------------------------------
    R                       0.679       RMSE                 80.905 
    R-Squared               0.461       Coef. Var            76.277 
    Adj. R-Squared          0.420       MSE                6545.611 
    Pred R-Squared          0.222       MAE                  56.076 
    ----------------------------------------------------------------
     RMSE: Root Mean Square Error 
     MSE: Mean Square Error 
     MAE: Mean Absolute Error 

                                ANOVA                                  
    ----------------------------------------------------------------------
                      Sum of                                              
                     Squares        DF    Mean Square      F         Sig. 
    ----------------------------------------------------------------------
    Regression     72857.985         1      72857.985    11.131    0.0054 
    Residual       85092.949        13       6545.611                     
    Total         157950.933        14                                    
    ----------------------------------------------------------------------

                                    Parameter Estimates                                      
    --------------------------------------------------------------------------------------------
          model       Beta    Std. Error    Std. Beta      t        Sig        lower      upper 
    --------------------------------------------------------------------------------------------
    (Intercept)    -42.614        49.218                 -0.866    0.402    -148.943     63.714 
      Education     65.594        19.661        0.679     3.336    0.005      23.120    108.069 
    --------------------------------------------------------------------------------------------

### Step 1: Education

In this step, the initial model includes only the "Education" predictor. The model summary provides various statistics about the model's performance:

R-squared: Indicates the proportion of variance in the response variable explained by the predictor.(0.461)

Adjusted R-squared: Adjusts R-squared for the number of predictors.(0.420)

RMSE: Root Mean Square Error, a measure of prediction accuracy.(80.905)

ANOVA: Analysis of Variance table showing the breakdown of the sum of squares for regression and residuals.

Coefficient estimates: The intercept and coefficient for the "Education" predictor, along with their statistical significance.


Forward Selection: Step 2 

    + Location 

                         Model Summary                           
    ----------------------------------------------------------------
    R                       0.775       RMSE                 72.475 
    R-Squared               0.601       Coef. Var            68.330 
    Adj. R-Squared          0.534       MSE                5252.632 
    Pred R-Squared          0.349       MAE                  45.085 
    ----------------------------------------------------------------
     RMSE: Root Mean Square Error 
     MSE: Mean Square Error 
     MAE: Mean Absolute Error 

                                ANOVA                                 
    ---------------------------------------------------------------------
                      Sum of                                             
                     Squares        DF    Mean Square      F        Sig. 
    ---------------------------------------------------------------------
    Regression     94919.353         2      47459.676    9.035    0.0040 
    Residual       63031.580        12       5252.632                    
    Total         157950.933        14                                   
    ---------------------------------------------------------------------

                                     Parameter Estimates                                      
    ---------------------------------------------------------------------------------------------
        model        Beta        Std. Error    Std. Beta      t        Sig          lower      upper 
    ---------------------------------------------------------------------------------------------
    (Intercept)     -165.637      74.480       -2.224        0.046    -327.915     -3.358 
    Education        59.085       17.896        0.612        3.302    0.006      20.092     98.078 
    Location         82.666       40.337        0.380        2.049    0.063      -5.220    170.552 
    ---------------------------------------------------------------------------------------------



    No more variables to be added.

    Variables Entered: 

    + Education 
    + Location 


    Final Model Output 
    ------------------

                         Model Summary                           
    ----------------------------------------------------------------
    R                       0.775       RMSE                 72.475 
    R-Squared               0.601       Coef. Var            68.330 
    Adj. R-Squared          0.534       MSE                5252.632 
    Pred R-Squared          0.349       MAE                  45.085 
    ----------------------------------------------------------------
     RMSE: Root Mean Square Error 
     MSE: Mean Square Error 
     MAE: Mean Absolute Error 

                                ANOVA                                 
    ---------------------------------------------------------------------
                      Sum of                                             
                     Squares        DF    Mean Square      F        Sig. 
    ---------------------------------------------------------------------
    Regression     94919.353         2      47459.676    9.035    0.0040 
    Residual       63031.580        12       5252.632                    
    Total         157950.933        14                                   
    ---------------------------------------------------------------------

                                     Parameter Estimates                                      
    ---------------------------------------------------------------------------------------------
          model        Beta    Std. Error    Std. Beta      t        Sig        lower      upper 
    ---------------------------------------------------------------------------------------------
    (Intercept)    -165.637        74.480                 -2.224    0.046    -327.915     -3.358 
      Education      59.085        17.896        0.612     3.302    0.006      20.092     98.078 
       Location      82.666        40.337        0.380     2.049    0.063      -5.220    170.552 
    ---------------------------------------------------------------------------------------------

### Step 2: Location

In this step, the "Location" predictor is added to the model. The model summary and ANOVA table are presented again, along with parameter estimates for both "Education" and "Location" predictors.

Final Model Output

After both "Education" and "Location" predictors have been added, the final model summary, ANOVA table, and parameter estimates are shown once more. Since there are no more predictors to add, the process concludes.

Final Model: Salary= -165.637 + 59.085 (Education) + 82.666 (Location) + £<sub>i</sub>


## 2.3    Stepwise Backward Regression
The purpose of backward elimination is to simplify the model by removing non-significant predictors, which helps create a more parsimonious and interpretable model while maintaining its predictive power. The process is guided by p-values and statistical measures to ensure that the retained predictors are meaningful and relevant to the response variable.
Here we're building a regression model from a set of candidate predictor variables by entering predictors based on p-value from the full model, in a backward stepwise manner until there is no variable left to remove any more. In this report we’re setting our αenter to be 0.15 for a variable to enter the model, i.e. a particular variable is removed if its p-value is greater than αenter=0.15.  
Backward Elimination: 
Full Model: Salary=β<sub>0</sub>+β<sub>1</sub>Education+β<sub>2</sub>Gender+β<sub>3</sub>Experience+β<sub>4</sub>Age+β<sub>5</sub>Location+£<sub>i</sub>
Predictor Variables: Education, Gender, Experience, Location, Age

    ols_step_backward_p(model, details = TRUE, progress = TRUE, prem = 0.15)

This line of code uses the ols_step_backward_p() function from the olsrr package to perform stepwise backward regression on the model with a significance level (p-value) of 0.15. The details = TRUE argument displays detailed information about the stepwise process, and progress = TRUE shows the progress of the regression.

### Backward Elimination Method 
---------------------------

Candidate Terms: 

1 . Education 
2 . Gender 
3 . Experience 
4 . Location 
5 . Age 

We are eliminating variables based on p value...

x Experience 

### Backward Elimination: Step 1 
Experience Removed

In this step, the initial model includes all candidate predictor variables. The least significant variable, "Experience," is removed from the model based on its p-value. The model summary and ANOVA table are presented:

R-squared: Proportion of variance in the response variable explained by the predictors. (0.761)

Adjusted R-squared: Adjusted R-squared for the number of predictors. (0.665)

RMSE: Root Mean Square Error, a measure of prediction accuracy.

ANOVA: Analysis of Variance table showing the breakdown of the sum of squares for regression and residuals.

Coefficient estimates for remaining predictors.

Variable Experience Removed 

                         Model Summary                           
    ----------------------------------------------------------------
    R                       0.872       RMSE                 61.473 
    R-Squared               0.761       Coef. Var            57.957 
    Adj. R-Squared          0.665       MSE                3778.983 
    Pred R-Squared          0.324       MAE                  39.962 
    ----------------------------------------------------------------
     RMSE: Root Mean Square Error 
     MSE: Mean Square Error 
     MAE: Mean Absolute Error 

                                ANOVA                                 
    ---------------------------------------------------------------------
                      Sum of                                             
                     Squares        DF    Mean Square      F        Sig. 
    ---------------------------------------------------------------------
    Regression    120161.100         4      30040.275    7.949    0.0038 
    Residual       37789.834        10       3778.983                    
    Total         157950.933        14                                   
    ---------------------------------------------------------------------

                                     Parameter Estimates                                       
    ----------------------------------------------------------------------------------------------
          model        Beta    Std. Error    Std. Beta      t        Sig        lower       upper 
    ----------------------------------------------------------------------------------------------
    (Intercept)    -387.188       107.390                 -3.605    0.005    -626.468    -147.907 
      Education      45.138        16.123        0.467     2.800    0.019       9.214      81.062 
         Gender      84.399        36.522        0.403     2.311    0.043       3.023     165.774 
       Location      52.162        37.712        0.240     1.383    0.197     -31.865     136.189 
            Age       5.820         2.852        0.393     2.041    0.069      -0.535      12.174 
    ----------------------------------------------------------------------------------------------


    x Location 

### Backward Elimination: Step 2 
Location Removed

In this step, the "Location" variable is removed from the model due to its p-value. The model summary and ANOVA table are presented again.

Elimination Summary

After the elimination steps are complete, a summary is provided. This summary includes information about the elimination process:

Variables eliminated in each step.

R-squared and adjusted R-squared values at each step.
        
The C(p) value, a statistic used to guide model selection.
    
AIC (Akaike Information Criterion), a measure of model quality that penalizes complexity.
    
RMSE for each step.

     Variable Location Removed 

                         Model Summary                           
    ----------------------------------------------------------------
    R                       0.846       RMSE                 63.974 
    R-Squared               0.715       Coef. Var            60.315 
    Adj. R-Squared          0.637       MSE                4092.695 
    Pred R-Squared          0.391       MAE                  42.348 
    ----------------------------------------------------------------
     RMSE: Root Mean Square Error 
     MSE: Mean Square Error 
     MAE: Mean Absolute Error 

                                ANOVA                                 
    ---------------------------------------------------------------------
                      Sum of                                             
                     Squares        DF    Mean Square      F        Sig. 
    ---------------------------------------------------------------------
    Regression    112931.285         3      37643.762    9.198    0.0025 
    Residual       45019.648        11       4092.695                    
    Total         157950.933        14                                   
    ---------------------------------------------------------------------

                                     Parameter Estimates                                       
    ----------------------------------------------------------------------------------------------
          model        Beta    Std. Error    Std. Beta      t        Sig        lower       upper 
    ----------------------------------------------------------------------------------------------
    (Intercept)    -365.805       110.595                 -3.308    0.007    -609.223    -122.388 
      Education      45.937        16.768        0.476     2.740    0.019       9.031      82.843 
         Gender      92.179        37.554        0.440     2.455    0.032       9.524     174.835 
            Age       7.475         2.694        0.505     2.775    0.018       1.545      13.404 
    ----------------------------------------------------------------------------------------------



    No more variables satisfy the condition of p value = 0.15


    Variables Removed: 

    x Experience 
    x Location 


    Final Model Output 
    ------------------

                         Model Summary                           
    ----------------------------------------------------------------
    R                       0.846       RMSE                 63.974 
    R-Squared               0.715       Coef. Var            60.315 
    Adj. R-Squared          0.637       MSE                4092.695 
    Pred R-Squared          0.391       MAE                  42.348 
    ----------------------------------------------------------------
     RMSE: Root Mean Square Error 
     MSE: Mean Square Error 
     MAE: Mean Absolute Error 

                                ANOVA                                 
    ---------------------------------------------------------------------
                      Sum of                                             
                     Squares        DF    Mean Square      F        Sig. 
    ---------------------------------------------------------------------
    Regression    112931.285         3      37643.762    9.198    0.0025 
    Residual       45019.648        11       4092.695                    
    Total         157950.933        14                                   
    ---------------------------------------------------------------------

                                     Parameter Estimates                                       
    ----------------------------------------------------------------------------------------------
          model        Beta    Std. Error    Std. Beta      t        Sig        lower       upper 
    ----------------------------------------------------------------------------------------------
    (Intercept)    -365.805       110.595                 -3.308    0.007    -609.223    -122.388 
      Education      45.937        16.768        0.476     2.740    0.019       9.031      82.843 
         Gender      92.179        37.554        0.440     2.455    0.032       9.524     174.835 
            Age       7.475         2.694        0.505     2.775    0.018       1.545      13.404 
    ----------------------------------------------------------------------------------------------


                            Elimination Summary                             
    ---------------------------------------------------------------------------
            Variable                    Adj.                                       
    Step     Removed      R-Square    R-Square     C(p)       AIC        RMSE      
    ---------------------------------------------------------------------------
       1    Experience      0.7607       0.665    4.4310    172.0443    61.4734    
       2    Location         0.715      0.6372    4.2353    172.6702    63.9742    
    ---------------------------------------------------------------------------
    
No more variables satisfy the condition of α<sub>remove</sub>=0.15

Variables Removed: Experience, Location

Final Model: Salary=-365.805+45.937(Education)+92.179(Gender)+7.475(Age)+£<sub>i</sub>



### 2.4 Perform stepwise regression (both forward and backward)
    ols_step_both_p(model, details = TRUE, pent = 0.15, prem = 0.15)

This line of code uses the ols_step_both_p() function from the olsrr package to perform stepwise regression (both forward and backward) on the model with a significance level (p-value) of 0.15 for both entering and removing variables. The details = TRUE argument displays detailed information about the stepwise process.

Stepwise Selection Method   

Candidate Terms: 

1. Education 
2. Gender 
3. Experience 
4. Location 
5. Age 

We are selecting variables based on p value...


Stepwise Selection: Step 1 

+ Education 

                         Model Summary                           
        ----------------------------------------------------------------
        R                       0.679       RMSE                 80.905 
        R-Squared               0.461       Coef. Var            76.277 
        Adj. R-Squared          0.420       MSE                6545.611 
        Pred R-Squared          0.222       MAE                  56.076 
        ----------------------------------------------------------------
         RMSE: Root Mean Square Error 
         MSE: Mean Square Error 
         MAE: Mean Absolute Error 

                                ANOVA                                  
        ----------------------------------------------------------------------
                          Sum of                                              
                         Squares        DF    Mean Square      F         Sig. 
        ----------------------------------------------------------------------
        Regression     72857.985         1      72857.985    11.131    0.0054 
        Residual       85092.949        13       6545.611                     
        Total         157950.933        14                                    
        ----------------------------------------------------------------------

                                        Parameter Estimates                                      
        --------------------------------------------------------------------------------------------
              model       Beta    Std. Error    Std. Beta      t        Sig        lower      upper 
        --------------------------------------------------------------------------------------------
        (Intercept)    -42.614        49.218                 -0.866    0.402    -148.943     63.714 
          Education     65.594        19.661        0.679     3.336    0.005      23.120    108.069 
        --------------------------------------------------------------------------------------------

Step 1: Education Added

In this step, the process starts with an empty model and adds the "Education" variable, as it has the lowest p-value among the candidate terms. The model summary and ANOVA table are presented:

R-squared: Proportion of variance in the response variable explained by the predictor. (0.461)
    
Adjusted R-squared: Adjusted R-squared for the number of predictors. (0.420)
    
RMSE: Root Mean Square Error, a measure of prediction accuracy.
    
ANOVA: Analysis of Variance table showing the breakdown of the sum of squares for regression and residuals.
    
Coefficient estimates for the predictor.

Stepwise Selection: Step 2 

+ Location 

                             Model Summary                           
        ----------------------------------------------------------------
        R                       0.775       RMSE                 72.475 
        R-Squared               0.601       Coef. Var            68.330 
        Adj. R-Squared          0.534       MSE                5252.632 
        Pred R-Squared          0.349       MAE                  45.085 
        ----------------------------------------------------------------
         RMSE: Root Mean Square Error 
         MSE: Mean Square Error 
         MAE: Mean Absolute Error 

                                ANOVA                                 
        ---------------------------------------------------------------------
                          Sum of                                             
                         Squares        DF    Mean Square      F        Sig. 
        ---------------------------------------------------------------------
        Regression     94919.353         2      47459.676    9.035    0.0040 
        Residual       63031.580        12       5252.632                    
        Total         157950.933        14                                   
        ---------------------------------------------------------------------

                                         Parameter Estimates                                      
        ---------------------------------------------------------------------------------------------
              model        Beta    Std. Error    Std. Beta      t        Sig        lower      upper 
        ---------------------------------------------------------------------------------------------
        (Intercept)    -165.637        74.480                 -2.224    0.046    -327.915     -3.358 
          Education      59.085        17.896        0.612     3.302    0.006      20.092     98.078 
           Location      82.666        40.337        0.380     2.049    0.063      -5.220    170.552 
        ---------------------------------------------------------------------------------------------



                         Model Summary                           
        ----------------------------------------------------------------
        R                       0.775       RMSE                 72.475 
        R-Squared               0.601       Coef. Var            68.330 
        Adj. R-Squared          0.534       MSE                5252.632 
        Pred R-Squared          0.349       MAE                  45.085 
        ----------------------------------------------------------------
         RMSE: Root Mean Square Error 
         MSE: Mean Square Error 
         MAE: Mean Absolute Error 

                                ANOVA                                 
        ---------------------------------------------------------------------
                          Sum of                                             
                         Squares        DF    Mean Square      F        Sig. 
        ---------------------------------------------------------------------
        Regression     94919.353         2      47459.676    9.035    0.0040 
        Residual       63031.580        12       5252.632                    
        Total         157950.933        14                                   
        ---------------------------------------------------------------------

                                     Parameter Estimates                                      
        ---------------------------------------------------------------------------------------------
              model        Beta    Std. Error    Std. Beta      t        Sig        lower      upper 
        ---------------------------------------------------------------------------------------------
        (Intercept)    -165.637        74.480                 -2.224    0.046    -327.915     -3.358 
          Education      59.085        17.896        0.612     3.302    0.006      20.092     98.078 
           Location      82.666        40.337        0.380     2.049    0.063      -5.220    170.552 
        ---------------------------------------------------------------------------------------------

No more variables to be added/removed.

Final Model Output 

                         Model Summary                           
        ----------------------------------------------------------------
        R                       0.775       RMSE                 72.475 
        R-Squared               0.601       Coef. Var            68.330 
        Adj. R-Squared          0.534       MSE                5252.632 
        Pred R-Squared          0.349       MAE                  45.085 
        ----------------------------------------------------------------
         RMSE: Root Mean Square Error 
         MSE: Mean Square Error 
         MAE: Mean Absolute Error 

                                ANOVA                                 
        ---------------------------------------------------------------------
                          Sum of                                             
                         Squares        DF    Mean Square      F        Sig. 
        ---------------------------------------------------------------------
        Regression     94919.353         2      47459.676    9.035    0.0040 
        Residual       63031.580        12       5252.632                    
        Total         157950.933        14                                   
        ---------------------------------------------------------------------

                                     Parameter Estimates                                      
        ---------------------------------------------------------------------------------------------
              model        Beta    Std. Error    Std. Beta      t        Sig        lower      upper 
        ---------------------------------------------------------------------------------------------
        (Intercept)    -165.637        74.480                 -2.224    0.046    -327.915     -3.358 
          Education      59.085        17.896        0.612     3.302    0.006      20.092     98.078 
           Location      82.666        40.337        0.380     2.049    0.063      -5.220    170.552 
        ---------------------------------------------------------------------------------------------

                              Stepwise Selection Summary                                
        ---------------------------------------------------------------------------------------
                              Added/                   Adj.                                        
        Step    Variable     Removed     R-Square    R-Square     C(p)        AIC        RMSE      
        ---------------------------------------------------------------------------------------
           1    Education    addition       0.461       0.420    10.2360    178.2199    80.9050    
           2    Location     addition       0.601       0.534     6.7300    175.7183    72.4750    
        ---------------------------------------------------------------------------------------

No more variables to be added or removed based on α<sub>enter</sub>=0.15, α<sub>remove</sub>=0.15 

Final Model: Salary= -165.637 + 59.085 (Education) + 82.666 (Location) + £<sub>i</sub>


# 3.0 Discussion of Results
## 3.1 All Possible Subsets

The model with the highest R2adj and lowest sqrt (MSE) which is Salary=β<sub>0</sub>+β<sub>1</sub>Education+β<sub>2</sub>Gender+β<sub>4</sub>Age+β<sub>5</sub>Location+£<sub>i</sub> is been chosen. The model is being chosen based on its lower MSE because its lower value indicates a better fit, also the model is being chosen based on its high R<sub>2</sub>adj of 0.665 which indicates that 66.5% variation in the Salary is explained by the independent variables (Education, Experience, Gender, Location, Age), and also contains smaller numbers of predictors. The experience was considered not significant because it contributes 1.1% to salary.
Final Model:
Salary= -387.188+45.138(Education)+84.399(Gender)+5.820(Age)+52.162(Location)+ £<sub>i</sub>




3.2	Forward Stepwise Selection
Variables are being added into the null model (Salary=β<sub>0</sub>+£<sub>i</sub>) one by one. In forward step 1, we add Education because it gives the single best improvement to the model based on its p-value. In forward step 2, we add Location because it gives an improvement to the model given that Education is present in the model. The model no longer improves with adding more variables (Experience, Gender, Age), then we stop the process, i.e. the variables not added are not contributing to the salary.
Final model: Salary= -165.637 + 59.085(Education) + 82.666(Location)+ £<sub>i</sub>

3.3	Backward Stepwise Selection
Variables are being removed from the full model (Salary=β<sub>0</sub>+β<sub>1</sub>Education+β<sub>2</sub>Gender+β<sub>4</sub>Age+β<sub>5</sub>Location+£<sub>i</sub>. In backward step 1, Experience was removed because it gives no improvement to the model. In step 2, Location was removed also because it gives no improvement to the model. i.e. Experience and Location are not contributing as others are not removed to Salary.
Final Model: Salary= -365.805+45.937(Education)+92.179(Gender)+7.475(Age) + £<sub>i</sub>

3.4	Stepwise Selection
Variables are added or removed in a stepwise manner until there are no variables to be added to the model again. In stepwise step 1, Education was added first and all other variables were removed. In stepwise step 2, Location was added given that Education is contributing to Salary. The process was halted since there are no variables to be added or removed from the model.
Final Model: Salary= -165.637 + 59.085(Education) + 82.666(Location)+ £<sub>i</sub>

# 4.0 Conclusion
This report sought to determine the factors that influence the salaries of workers using different approaches such as all possible subsets methods, forward stepwise regression method, backward stepwise regression method, and stepwise methods. The analysis revealed that education, age, gender, and location contribute more to the salaries of workers compared to experience. It is recommended to consider these factors while determining compensation structures for employees.

# 4.1 Recommendations
Further analysis and investigation may be necessary to understand the specific impact of each variable on salary levels. Additionally, considering other factors like job position, performance, and industry-specific variables might provide further insights into the salary determination process.
