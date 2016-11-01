library(tidyverse)
library(apaTables)
library(cocor)
#Question 1
bfi <- read.csv("bfi2.csv")
apa.cor.table(bfi)
cocor(~A1+C1|E1+O1, data=as.data.frame(bfi))

#Question 2
cocor(~C1+A1|E1+A1, data=as.data.frame(bfi))

#Question 3
bfi_men <- bfi %>% filter(gender==1) %>% select(-gender)
bfi_women <- bfi %>% filter(gender==2) %>% select(-gender)

apa.cor.table(bfi_men)
apa.cor.table(bfi_women)

bfi_men <- as.data.frame(bfi_men)
bfi_women <- as.data.frame(bfi_women)

cocor(~A1+E1|A1+E1, data=list(bfi_men, bfi_women))

#Question 4
## Compare the difference between the correlations (rating, raises) and
# (rating, critical) measured in the same group:
r.jk <- .59  # Correlation (rating, raises)
r.jh <- .16  # Correlation (rating, critical)
r.kh <- .38  # Correlation (raises, critical)
n <- 30  # Size of the group

cocor.dep.groups.overlap(r.jk, r.jh, r.kh, n, var.labels=c("rating", "raises",
                                                           "critical"))

#Question 5
# Compare the difference between the correlations (rating, raises) and
# body mass (complaints, critical) measured in the same group (all values are fictional):
r.jk <- .59  # Correlation (rating, raises)
r.hm <- .19  # Correlation (complaints, critical)
r.jh <- .83  # Correlation (rating, complaints)
r.jm <- .16  # Correlation (rating, critical)
r.kh <- .67  # Correlation (raises, complaints)
r.km <- .38  # Correlation (raises, critical)
n <- 30  # Size of the group

cocor.dep.groups.nonoverlap(r.jk, r.hm, r.jh, r.jm, r.kh, r.km, n,
                            var.labels=c("rating", "raises", "complaints", "critical"))


#Question 6
# Compare the difference between two correlations based
# on two independent groups:
r1.jk <- .59  # Correlation between rating and raises measured in group 1
n1 <- 30    # Size of group 1

r2.hm <- .03  # Correlation between rating and raises measured in group 2
n2 <- 3000    # Size of group 2

cocor.indep.groups(r1.jk, r2.hm, n1, n2, data.name=c("study1", "study2"),
                   var.labels=c("rating", "raises", "rating", "raises"))
