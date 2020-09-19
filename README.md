# Wine Linear Regression

## Linear regression model

One variable regression model

>###			**yi = β0 + β1xi + εi,   i=1,2, …, N**

**yi** - ith observation of dependent variable (wine price)

**xi** - ith observation of independent variable (AGST)

**εi** - error term for the ith observation 

**β0** - intercept coefficient

**β1** - regression coefficient for the independent variable

Good models have small error terms εi

- More stars (*) is better, (.) indicates weak significance
- Higher growing season temperatures lead to higher price
- Our model is better than base model by 41%
- Model explains 41% of data variance

Coefficients:

|              | Estimate Std. | Error     | t value | Pr(>\|t\|) |     |
|--------------|---------------|-----------|---------|------------|-----|
| (Intercept)  | -3.4299802    | 1.7658975 | -1.942  | 0.066311   | .   |
| AGST         | 0.6072093     | 0.0987022 | 6.152   | 5.2e-06    | *** |
| HarvestRain  | -0.0039715    | 0.0008538 | -4.652  | 0.000154   | *** |
| WinterRain   | 0.0010755     | 0.0005073 | 2.120   | 0.046694   | *   |
| Age          | 0.0239308     | 0.0080969 | 2.956   | 0.007819   | **  |

- Training set (23 observations)
- Testign set (2 observations)
- Out of sample prediction R-squared is 79%

|                    Variables                  |     Model R2    |     Test R2    |
|:---------------------------------------------:|:---------------:|:--------------:|
|     AGST                                      |         0.44    |        0.79    |
|     AGST,   Harvest Rain                      |         0.71    |       -0.08    |
|     AGST,   Harvest Rain, Age                 |         0.79    |        0.53    |
|     AGST,   Harvest Rain, Age, Winter Rain    |         0.83    |        0.79    |
