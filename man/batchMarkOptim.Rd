% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/batchMarkfun.R
\name{batchMarkOptim}
\alias{batchMarkOptim}
\title{Marked model only.}
\usage{
batchMarkOptim(
  par = NULL,
  data,
  covariate_phi = NULL,
  covariate_p = NULL,
  choiceModel = c("model1", "model2", "model3", "model4"),
  method = c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B"),
  lowerBound = -Inf,
  control,
  ...
)
}
\arguments{
\item{par}{Initial values for the parameters to be optimized over.}

\item{data}{A capture-recapture data matrix or data frame}

\item{covariate_phi}{This covariate placeholder for the parameter phi_t}

\item{covariate_p}{This covariate placeholder for the parameter p_t}

\item{choiceModel}{This chooses among different models and allow for model selection}

\item{method}{The method to be used. See \code{\link{optim}} for details.}

\item{lowerBound}{Lower bounds on the variables for the "L-BFGS-B" \code{method}.}

\item{control}{A list of control parameters. See optim for details.}

\item{...}{Further arguments to be passed by user which goes into the \code{\link{optim}} function.}
}
\value{
For \code{batchMarkOptim}, a list with components:
\describe{
\item{phi}{The survival probability and remaining in the population between occasion t and t+1.}
\item{p}{The capture probability at occasion time t.}
\item{ll}{The optimized log-likelihood value of marked model.}
\item{hessian}{The hessian matrix.}
\item{AIC}{The Akaike Information Criteria for model selection.}
}
}
\description{
batchMarkOptim function optimizes \code{\link{batchMarkHmmLL}} function.
}
\details{
Note that arguments after ... must be matched exactly.
\code{\link{batchMarkOptim}} depends on \code{\link{optim}} function to optimize the parameters of the marked model only. By default optim performs minimization.
}
\examples{
# Load the package
library(extBatchMarking)

# Load the WeatherLoach data from Cowen et al., 2017.
data(WeatherLoach)

# Initial parameter values
theta <- c(0, -1)

\donttest{
mod1 <- batchMarkOptim(
           par           = theta,
           data          = WeatherLoach,
           choiceModel   = "model4",
           method        = "BFGS",
           control       = list(trace = 1),
           covariate_phi = NULL,
           covariate_p   = NULL)

 # print(mod1)

 # Survival probability
 mod1$phi
 # Capture probability
 mod1$p
 # Optimized log-likelihood
 mod1$ll
 # The Aikaike Information Criteria
 mod1$AIC
 }

 \donttest{
 mod2 <- batchMarkOptim(
           par           = theta,
           data          = WeatherLoach,
           choiceModel   = "model4",
           method        = "L-BFGS-B",
           control       = list(trace = 1),
           covariate_phi = NULL,
           covariate_p   = NULL)

 # print(mod2)
 # Survival probability
 mod2$phi
 # Capture probability
 mod2$p
 # Optimized log-likelihood
 mod2$ll
 # The Akaike Information Criteria
 mod2$AIC
 }
}
\references{
Laura L. E. Cowen, Panagiotis Besbeas, Byron J. T. Morgan, 2017.: Hidden Markov Models for Extended Batch Data,
Biometrics, 73, 1321-1331. DOI: 10.1111/biom.12701.
}
