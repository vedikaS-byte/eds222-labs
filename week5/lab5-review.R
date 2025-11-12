# Hypo testsing: starting from null distribution (H0)
# H0 assumes no difference between phat1 and phat2 
# HA: IF there is no difference, toss them all in the same bag 

# Simulate null distribution
p <- .5 # Every single time do experiment... regardless of treatment, you have a 50% chance of eelgrass working
n1 <- 600
n2 <- 400

# Sumulate samples at the null distribution
n_samples <- 1e4
x1 <- rbinom(n = n_samples, 
            size = n1, 
            prob = p)

x2 <- rbinom(n = n_samples, 
            size = n2, 
            prob = p)

# Calculate stat for each sample
p1_hat <- x1/n1
p2_hat <- x2/n2
diff_prop = p2_hat - p1_hat

# Look at SE: SE for H0 = SE for p_hat (assuming H0 exists)
p_hat <- (x1+x2) / (n1+n2) 
hist(p_hat)

# Why is mean 0? Null... no difference
# Why is sd = se_null... SD is SE
# Why is the first argument = diff_prop? ... How much of tail falls to right of value?
se_null <- sqrt(p_hat*(1-p_hat)*(1/n1 + 1/n2))
pval <- pnorm(diff_prop, mean = 0, sd = se_null, lower.tail = F)

mean(pval <= .05)

diff_prop
hist(p2_hat-p1_hat)
?pnorm()

# rbinom() for creating simulated data





