#Rybinski, lecture 2, linear models

#This should be your working director that contains wine.csv file
setwd("")

# Read in data from MIT course
wine = read.csv("wine_linear_regression.csv")
str(wine)
summary(wine)

#plot basic data, age-price ####################
plot(wine$Age, wine$Price)

ccc = 1.5
plot(wine$Age, wine$Price, 
xlab = "Wine age (years)", ylab = "", 
cex.lab = ccc, 
cex = ccc,
col = "red", pch = 19)
title(ylab="Wine price (log)", line=2.5, cex.lab=ccc)
avg.price = mean(wine$Price)
abline(a=avg.price, b=0, lwd=3)
abline(lsfit(wine$Age, wine$Price), lwd=3, col="darkred")
a=lsfit(wine$Age, wine$Price)
a$coefficients

#plot basic data, winter rain - price #####################
ccc = 1.5
plot(wine$WinterRain, wine$Price, 
xlab = "Winter rain (mm)", ylab = "", 
cex.lab = ccc, 
cex = ccc,
col = "blue", pch = 19)
title(ylab="Wine price (log)", line=2.5, cex.lab=ccc)
avg.price = mean(wine$Price)
abline(a=avg.price, b=0, lwd=3, col="black")
abline(lsfit(wine$WinterRain, wine$Price), lwd=3, col="darkblue")
a=lsfit(wine$WinterRain, wine$Price)
a$coefficients


#plot basic data, Average growing season temp - price #####################
ccc = 1.5
plot(wine$AGST, wine$Price, 
xlab = "AGST (Celsius)", ylab = "", 
cex.lab = ccc, 
cex = ccc,
col = "orange", pch = 19)
title(ylab="Wine price (log)", line=2.5, cex.lab=ccc)
avg.price = mean(wine$Price)
abline(a=avg.price, b=0, lwd=3, col="black")
abline(lsfit(wine$AGST, wine$Price), lwd=3, col="darkorange")
a=lsfit(wine$AGST, wine$Price)
a$coefficients



#plot basic data, Harvest rain - price #####################
ccc = 1.5
plot(wine$HarvestRain, wine$Price, 
xlab = "Harvest rain (mm)", ylab = "", 
cex.lab = ccc, 
cex = ccc,
col = "green", pch = 19)
title(ylab="Wine price (log)", line=2.5, cex.lab=ccc)
avg.price = mean(wine$Price)
abline(a=avg.price, b=0, lwd=3, col="black")
abline(lsfit(wine$HarvestRain, wine$Price), lwd=3, col="darkgreen")
a=lsfit(wine$HarvestRain, wine$Price)
a$coefficients


hist(wine$Price, 
breaks=c(6.0,6.25,6.50,6.75,7.0,7.25,7.50,7.75,8.0,8.25,8.50),
col="orange")

TSS = sum((wine$Price-avg.price)^2)

# Linear Regression (one variable)
model1 = lm(Price ~ AGST, data=wine)
summary(model1)

# Sum of Squared Errors
model1$residuals
RSS_orange = sum(model1$residuals^2)
RSS_orange


#Compare R-squared of all single variable models
model1 = lm(Price ~ AGST, data=wine)
R2.m1= 1-sum(model1$residuals^2)/TSS
model2 = lm(Price ~ WinterRain, data=wine)
R2.m2= 1-sum(model2$residuals^2)/TSS
model3 = lm(Price ~ HarvestRain, data=wine)
R2.m3= 1-sum(model3$residuals^2)/TSS
model4 = lm(Price ~ Age, data=wine)
R2.m4= 1-sum(model4$residuals^2)/TSS

cat("R2 for AGST is", R2.m1, "\n")
cat("R2 for WinterRain is", R2.m2, "\n")
cat("R2 for HarvestRain", R2.m3, "\n")
cat("R2 for Age is", R2.m4, "\n")


# Linear Regression (all variables)
model5 = lm(Price ~ AGST + HarvestRain + WinterRain + Age, data=wine)
summary(model5)


# Correlation of explanatory variables
model6 = lm(Price ~ AGST + HarvestRain + WinterRain + Age + FrancePop, data=wine)
summary(model6)

cor(wine$WinterRain, wine$Price)
plot(wine$WinterRain, wine$Price)

cor(wine$Age, wine$FrancePop)
plot(wine$Age, wine$FrancePop)

cor(wine$Age, wine$Age)
plot(wine$Age, wine$Age)

cor(wine)

#What is the right model
model5 = lm(Price ~ AGST + HarvestRain + WinterRain + Age, data=wine)
summary(model5)

#Remove WinterRain
model7 = lm(Price ~ AGST + HarvestRain + Age, data=wine)
summary(model7)

# Predicting wine price

# Read in test set
wineTest = read.csv("wine_linear_regression_test.csv")
str(wineTest)

# Make test set predictions
predictTest = predict(model5, newdata=wineTest)
predictTest

# Compute R-squared
RSS = sum((wineTest$Price - predictTest)^2)
TSS = sum((wineTest$Price - mean(wine$Price))^2)
1 - RSS/TSS

#END
