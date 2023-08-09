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
