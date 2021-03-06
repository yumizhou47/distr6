#-------------------------------------------------------------
# SetInterval Documentation
#-------------------------------------------------------------
#' @title R6 Generalised Class for Symbolic Sets and Intervals
#'
#' @description The parent class to sets and intervals in R6. Primarily used for inheriting methods.
#'
#' @name SetInterval
#'
#' @section Constructor Arguments:
#'  \tabular{lll}{
#'    \strong{Argument} \tab \strong{Type} \tab \strong{Details} \cr
#'    \code{symbol} \tab character \tab Representation of set/interval. \cr
#'    \code{type} \tab character \tab Interval type, one of (), (], [), []. \cr
#'    \code{lower} \tab numeric \tab Lower limit of set/interval. \cr
#'    \code{upper} \tab numeric \tab Upper limit of set/interval. \cr
#'    \code{dimension} \tab integer \tab Dimension of set/interval.
#'}
#'
#' @section Accessor Methods:
#' \tabular{lll}{
#' \strong{Method} \tab \strong{Return Type} \tab \strong{Details} \cr
#' \code{lower} \tab numeric \tab Lower limit of set/interval. \cr
#' \code{upper} \tab numeric \tab Upper limit of set/interval. \cr
#' \code{type} \tab  character \tab Closed/open interval type. \cr
#' \code{dimension} \tab integer \tab Dimension of set/interval. \cr
#' \code{max} \tab  numeric \tab Maximum of set/interval. \cr
#' \code{min} \tab  numeric \tab Minimum of set/interval. \cr
#' \code{sup} \tab  numeric \tab Supremum of set/interval. \cr
#' \code{inf} \tab  numeric \tab Infimum of set/interval. \cr
#' \code{getSymbol} \tab  character \tab Symbolic representation of set/interval.
#' }
#'
#' @section Representation Methods:
#' \tabular{ll}{
#'   \strong{Method} \tab \strong{Details} \cr
#'   \code{print} \tab  Prints symbolic representation of set/interval \cr
#' }
#'
#' @details Whilst this is not an abstract class, direct construction is generally not advised.
#'   Construction should instead be called on 'Set' or 'Interval'
#'
#' @seealso \code{\link{Set}} for R6 Set objects and \code{\link{Interval}} for R6 Interval objects.
NULL
#-------------------------------------------------------------
# SetInterval Definition
#-------------------------------------------------------------
#' @export
SetInterval <- R6::R6Class("SetInterval")
SetInterval$set("public","initialize",function(symbol, lower, upper, type, dimension){
  private$.lower = lower
  private$.upper = upper
  private$.type = type
  private$.dimension = as.integer(dimension)
  private$.setSymbol = symbol
  invisible(self)
})
SetInterval$set("public","lower",function(){
  return(private$.lower)
})
SetInterval$set("public","upper",function(){
  return(private$.upper)
})
SetInterval$set("public","type",function(){
  return(private$.type)
})
SetInterval$set("public","dimension",function(){
  return(private$.dimension)
})
SetInterval$set("public","max",function(){
  if(private$.type %in% c("()","[)"))
    return(self$upper()-.Machine$double.eps)
  else
    return(self$upper())
})
SetInterval$set("public","min",function(){
  if(private$.type %in% c("()","(]"))
    return(self$lower()+.Machine$double.eps)
  else
    return(self$lower())
})
SetInterval$set("public","sup",function(){
  return(self$upper())
})
SetInterval$set("public","inf",function(){
  return(self$lower())
})
SetInterval$set("public","getSymbol",function() return(private$.setSymbol))
SetInterval$set("public","print",function(){
  print(self$getSymbol())
})

SetInterval$set("private",".lower",NULL)
SetInterval$set("private",".upper",NULL)
SetInterval$set("private",".type",NULL)
SetInterval$set("private",".dimension",NULL)
SetInterval$set("private",".setSymbol",NULL)
