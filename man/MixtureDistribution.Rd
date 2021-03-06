% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Wrapper_MixtureDistribution.R
\name{MixtureDistribution}
\alias{MixtureDistribution}
\title{Mixture Distribution Wrapper}
\format{An \code{\link[R6]{R6}} object.}
\description{
Wrapper used to construct a mixture of two or more distributions.
}
\details{
A Mixture Distribution is a weighted combination of two or more distributions such that for
pdf/cdfs of n distribution f_1,...,f_n/F_1,...,F_n and a given weight associated to each distribution,
w_1,...,w_n. The pdf of the mixture distribution M(X1,...,XN), f_M is given by
\deqn{f_M = sum_i (f_i)(w_i)}
and the cdf, F_M is given by
\deqn{F_M = sum_i (F_i)(w_i)}

If weights are given, they should be provided as a list of numerics summing to one. If NULL,
they are taken to be uniform, i.e. for n distributions, \eqn{w_i = 1/n, \forall i \in [1,n]}.
}
\section{Constructor Arguments}{

\tabular{lll}{
\strong{Argument} \tab \strong{Type} \tab \strong{Details} \cr
\code{distlist} \tab list \tab List of distributions. \cr
\code{weights} \tab list \tab List of weights. See Details. \cr
\code{...} \tab any \tab Additional arguments to pass to pdf/cdf.
}
}

\section{Public Methods}{

\tabular{ll}{
\strong{Method} \tab \strong{Details} \cr
\code{weights()} \tab Returns the weights of the wrapped distributions.
}
}

\examples{
mixture <- MixtureDistribution$new(list(Binomial$new(prob = 0.5, size = 10), Binomial$new()))
mixture$pdf(1)
mixture$cdf(1)
}
\seealso{
\code{\link{DistributionWrapper}} for wrapper details.
See \code{\link{Distribution}} for a list of public methods.
}
