Salary <- c(30,33,45,105,205,65,160,405,25,33,40,15,85,225,120)
Education <- c(1,2,3,2,4,1,4,4,1,2,2,1,3,2,2)
Experience <- c(5,2,6,1,10,2,9,16,10,1,2,3,6,1,3)
Gender <- c(1,2,1,1,1,1,1,2,1,2,1,1,2,2,2)
Location <- c(2,1,1,2,2,2,2,2,1,1,1,2,2,2,2)
Age <- c(35,27,29,32,40,45,36,45,35,23,25,28,27,24,28)
data <- data.frame(Salary,Education,Gender,Experience,Age,Location)

model <- lm(Salary~Education+Gender+Experience+Location+Age, data = data)
summary(aov(model))
summary(model)

library(olsrr)
a <- data.frame(ols_step_all_possible(model))
a
write.csv(a, "All possible.csv")
getwd()

c <- ols_step_forward_p(model, details = TRUE, penter = 0.1)


ols_step_backward_p(model,details = TRUE, progress = TRUE, prem = 0.15)

ols_step_both_p(model,details = TRUE, pent = 0.15, prem = 0.15)
