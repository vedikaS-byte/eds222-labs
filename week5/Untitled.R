# What is the difference between...
rnorm() # Generate random numbers for distribution
dnorm() # PDF for normal distribution (y-values or DENSITY of PDF)... shape of density curve
pnorm() # Cumulative probability (area under the curve TO THE LEFT of test stat.... ex. P(x < = 1))
qnorm() # Where on x-axis does area fall?

a_bunch_random_numbers <- rnorm(1e4, mean = 0, sd = 1)
hist(a_bunch_random_numbers)


# dnorm() tells shaoe of the PDF
library(tidyverse)
x <- seq(-4,4, length.out = 100)
density_x <- dnorm(x, mean = 0, sd = 1)
tibble(x, density_x) %>% 
  ggplot(aes(x = x, y = density_x)) + geom_line() + 
  theme_classic()


# pnorm()
# What's the probability of getting a random number less than -.67?
# Associate p values with pnorm() applied to the null distribution
pnorm(-.67, mean = 0, sd = 1)

# qnorm(): Area under the curve
# What x value corresponds to 2.5% area under the curve?
qnorm(c(.025, .975), mean = 0, sd = 1)
# Associate CIs with qnorm applied to the sampling distribution (NOT THE NULL DISTRIBUTION)








