---
title       : Predicting Gas Consuption
subtitle    : Miles Per Gallon (MPG)
author      : Alan Wong
job         : Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Context

Problem: How can we predict a vehicle's gas consumption?

<p><p>

Solution: Utilize data from the "***mtcars***" dataset, which  contains data on 32 automobile models from 1973-1974.

<p><p>

The prediction will be based after utilizing the following attributes:
* wt - weight of the car in U.S. tons
* cyl - number of cylinders in the car's engine
* mpg - gas mileage (U.S. miles per U.S. gallon)

--- .class #id 

## The Model

The estimation of gas mileage is done by a linear model given
a vehicle's weight and the number of cylinders in its engine:


```r
model <- lm(mpg ~ wt + cyl, data=mtcars)
model
```

```
## 
## Call:
## lm(formula = mpg ~ wt + cyl, data = mtcars)
## 
## Coefficients:
## (Intercept)           wt          cyl  
##      39.686       -3.191       -1.508
```

--- .class #id 

## Results


```r
model.summary <- summary(model)
model.summary[4]  # coeffecients
```

```
## $coefficients
##              Estimate Std. Error   t value     Pr(>|t|)
## (Intercept) 39.686261  1.7149840 23.140893 3.043182e-20
## wt          -3.190972  0.7569065 -4.215808 2.220200e-04
## cyl         -1.507795  0.4146883 -3.635972 1.064282e-03
```

```r
model.summary[8]  # r-squared
```

```
## $r.squared
## [1] 0.8302274
```


--- .class #d

## Live Interaction

Our prediction model can be tested interactivelly at the following link:   
https://myshinyappat.shinyapps.io/coursera-developing-data-products-master   
   
Change the number of cylinders and the weight of
the car and see where the resulting predicted mileage fits in with
the rest of the cars.

