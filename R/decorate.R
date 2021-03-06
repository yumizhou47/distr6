#' @title Decorate Distributions
#' @description A convenient S3 function to decorate R6 distributions
#'
#' @param distribution distribution to decorate
#' @param decorators list of decorators
#' @param R62S3 logical. If TRUE (default) S3 methods are generated for R6 methods
#'
#' @seealso \code{\link{DistributionDecorator}} for the abstract decorator class and
#' \code{\link{CoreStatistics}}, \code{\link{ExoticStatistics}}, \code{\link{FunctionImputation}} for
#' available decorators.
#'
#' @export
decorate <- function(distribution, decorators, R62S3 = TRUE){
  if(!checkmate::testList(decorators))
    decorators = list(decorators)

  dist_decors = distribution$decorators
  decors_names = lapply(decorators, function(x) x$classname)
  decorators = decorators[!(decors_names %in% dist_decors)]

  dist_name = substitute(distribution)

  if(length(decorators) == 0)
    return(paste(substitute(distribution),"is already decorated with",
                  paste0(decors_names,collapse=",")))
  else{
    lapply(decorators, function(a_decorator){

      if(a_decorator$classname == "FunctionImputation"){
        if(is.null(distribution$pdf(1))){
          pdf = FunctionImputation$public_methods$pdf
          formals(pdf)$self = distribution
          distribution$.__enclos_env__$private$.setPdf(pdf)
        }
        if(is.null(distribution$cdf(1))){
          cdf = FunctionImputation$public_methods$cdf
          formals(cdf)$self = distribution
          distribution$.__enclos_env__$private$.setCdf(cdf)
        }
        if(is.null(distribution$quantile(1))){
          quantile = FunctionImputation$public_methods$quantile
          formals(quantile)$self = distribution
          distribution$.__enclos_env__$private$.setQuantile(quantile)
        }
        if(is.null(distribution$rand(1))){
          rand = FunctionImputation$public_methods$rand
          formals(rand)$self = distribution
          distribution$.__enclos_env__$private$.setRand(rand)
        }
      } else{
        methods <- c(a_decorator$public_methods, get(paste0(a_decorator$inherit))$public_methods)
        methods <- methods[!(names(methods) %in% c("initialize","clone"))]
        methods <- methods[!(names(methods) %in% ls(distribution))]

        if(length(methods) > 0){
          for(i in 1:length(methods)){
            formals(methods[[i]]) = c(formals(methods[[i]]),list(self=distribution))
            assign(names(methods)[[i]],methods[[i]],envir=as.environment(distribution))
          }
        }
      }
    })

    unlockBinding("decorators", distribution)
    distribution$decorators = unlist(decors_names)
    lockBinding("decorators", distribution)

    if(R62S3){
      lapply(decorators, function(y){
        R62S3::R62S3(y, list(get(RSmisc::getR6Class(distribution))), as.environment("package:distr6"))
      })
    }
    message(paste(dist_name,"is now decorated with", paste0(decors_names,collapse = ",")))
  }
}
