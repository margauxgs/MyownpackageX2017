#' Simultaneously plots the popularity of more than one name
#'
#' @param names vector of several names for which we want to plot the popularity
#'
#' @return a graph
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import ggthemes
#' @import utils
#' @examples
#' \dontrun{
#' draw_names(c("Margaux","Pierre"))
#' }
draw_names <- function(names){
  data(prenoms)
  prenoms %>%
    group_by(year,name) %>%
    summarise(total = sum(n)) %>%
    filter(name %in% names) %>%
    ggplot(aes(year,total,color=name))+geom_line() +
    ggtitle(paste("Popularity of chosen names"))+
    ggthemes::theme_gdocs()
}

#' Plots the popularity of names in times using the_name and the_sex as arguments
#'
#' @param the_name name we want to draw the popularity of
#' @param the_sex sex associated to the name we want to draw the popularity of
#'
#' @return a graph
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import ggthemes
#' @import utils
#' @examples
#' \dontrun{
#' draw_a_name(the_name = "Margaux", the_sex ="F")
#' }
draw_a_name <- function(the_name,the_sex){
  assert_that(is.character(the_name))
  assert_that(is.character(the_sex))
  data(prenoms)
  prenoms %>%
    filter(name == the_name,sex == the_sex) %>%
    group_by(year) %>%
    summarise(n=sum(n,na.rm=TRUE)) %>%
    ggplot(aes(year,n)) + geom_line() +
    ggtitle(paste(the_name)) + ggthemes::theme_gdocs()
}
