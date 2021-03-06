% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assertions.R
\name{testNegativeSkew}
\alias{testNegativeSkew}
\alias{checkNegativeSkew}
\alias{assertNegativeSkew}
\alias{isNegativeSkew}
\title{assert/check/test/NegativeSkew}
\usage{
assertNegativeSkew(x)
checkNegativeSkew(x)
testNegativeSkew(x)
isNegativeSkew(x)
}
\arguments{
\item{x}{Distribution}
}
\value{
If check passes then \code{assert} returns invisibly and \code{test}/\code{check}/\code{is}
  return \code{TRUE}. If check fails, \code{assert} stops code with error, \code{check} returns
  an error message as string, \code{test}/\code{is} return \code{FALSE}.
}
\description{
Validation checks to test if Distribution is negative skew.
}
\examples{
testNegativeSkew(Binomial$new())

}
