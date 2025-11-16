library(tidyverse)
## Setup 
# Define x trials
x <- seq(0,10)
# Pass vector for lambda
lambda <- c(.5,2,5)

pmfb_poisson <- expand.grid(trials = x,
                            lambda = lambda) %>% 
  mutate(prob = dpois(trials, lambda))


pmfb_poisson %>% ggplot(aes(x = trials, y = prob)) +
  geom_point(shape = 21, fill = "white", color = "black") +
  geom_segment(aes(xend = trials, yend = 0)) +
  facet_wrap(~ lambda, ncol = 1, strip.position = "right") +
  labs(
    title = "PMFs for three Poisson random variables",
    x = "X (trials)",
    y = "Mass"
  ) +
  theme_bw() 
