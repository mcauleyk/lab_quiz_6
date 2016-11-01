library(tidyverse)
library(apaTables)
library(cocor)
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
