% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Design-class.R
\docType{class}
\name{TDDesign-class}
\alias{TDDesign-class}
\alias{.TDDesign}
\title{Design class using DLE responses only based on the pseudo DLE model without sample}
\description{
This is a class of design based only on DLE responses using the 'LogisticIndepBeta' class model
are used without samples.
In addition to the slots in the more simple \code{\linkS4class{RuleDesign}},
objects of this class contain:
}
\section{Slots}{

\describe{
\item{\code{model}}{the pseudo DLE model to be used, an object class of 
\code{\linkS4class{ModelTox}}}

\item{\code{stopping}}{stopping rule(s) for the trial, an object class of \code{\linkS4class{Stopping}}}

\item{\code{increments}}{how to control increments between dose levels, an object class of 
\code{\linkS4class{Increments}}}

\item{\code{PLcohortSize}}{rules for the cohort sizes for placebo, if any planned
an object of class \code{\linkS4class{CohortSize}}}
}}

\examples{
##Specified the design to run simulations
##The design comprises a model, the escalation rule, starting data, 
##a cohort size and a starting dose
##Define your data set first using an empty data set 
## with dose levels from 25 to 300 with increments 25
data <- Data(doseGrid=seq(25,300,25))

##The design only incorporate DLE responses and no DLE samples are involved
##Specified the model of 'ModelTox' class eg 'LogisticIndepBeta' class model
model<-LogisticIndepBeta(binDLE=c(1.05,1.8),DLEweights=c(3,3),DLEdose=c(25,300),data=data)
##Then the escalation rule
tdNextBest <- NextBestTD(targetDuringTrial=0.35,
                         targetEndOfTrial=0.3)

## The cohort size, size of 3 subjects
mySize <-CohortSizeConst(size=3)
##Deifne the increments for the dose-escalation process
##The maximum increase of 200\% for doses up to the maximum of the dose specified in the doseGrid
##The maximum increase of 200\% for dose above the maximum of the dose specified in the doseGrid
##This is to specified a maximum of 3-fold restriction in dose-esclation
myIncrements<-IncrementsRelative(intervals=c(min(data@doseGrid),max(data@doseGrid)), 
                                 increments=c(2,2))
##Specified the stopping rule e.g stop when the maximum sample size of 36 patients has been reached
myStopping <- StoppingMinPatients(nPatients=36)
##Now specified the design with all the above information and starting with a dose of 25
design <- TDDesign(model=model,
                   nextBest=tdNextBest,
                   stopping=myStopping,
                   increments=myIncrements,
                   cohortSize=mySize,
                   data=data,startingDose=25)
}
\keyword{class}
