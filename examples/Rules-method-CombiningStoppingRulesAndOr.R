
## Example of combining stopping rules with '&' and/or '|' operators

myStopping1 <- StoppingMinCohorts(nCohorts=3)
myStopping2 <- StoppingTargetProb(target=c(0.2, 0.35),
                                  prob=0.5)
myStopping3 <- StoppingMinPatients(nPatients=20)

myStopping <- (myStopping1 & myStopping2) | myStopping3




