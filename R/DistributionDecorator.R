#' @title Abstract Decorator for Distribution
#'
#' @description An abstract decorator object for distributions to enhance functionality.
#' @name DistributionDecorator
#'
#' @details This is an abstract class that cannot be directly constructed.
#'   See \code{\link{decorate}} for the function to decorate Distributions.
#'
#' @seealso \code{\link{decorate}} for the decorating function and \code{\link{listDecorators}}
#'  for available decorators.
NULL


#' @export
DistributionDecorator <- R6::R6Class("DistributionDecorator")
DistributionDecorator$set("public","initialize",function(dist, R62S3 = TRUE){
  if(RSmisc::getR6Class(self) == "DistributionDecorator")
    stop(paste0(RSmisc::getR6Class(self), " is an abstract class that can't be initialized. Try using
               decorate([distribution], ",RSmisc::getR6Class(self),")"))

  decorate(dist, get(RSmisc::getR6Class(self)), R62S3)
})
