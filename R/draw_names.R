#' Simultaneously plot the popularity of more than one name
#'
#' @param names vector of several names for which we want to plot the popularity
#'
#' @return a graph
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#'
#' @examples
#' \dontrun{
#' draw_names(vector of names I want to plot)
#' }
draw_names <- function(names){

  prenoms %>%
    group_by(year,name) %>%
    summarise(total = sum(n))    %>%

    filter(name %in% names) %>%
    ggplot(aes(year,total,color=name))+geom_line() +
    ggtitle(paste("Popularity of names", names, collapse = ";"))+
    ggthemes::theme_gdocs()

}


#' Plots the popularity of names in times using the_name and the_sex as arguments
#'
#' @param the_name
#' @param the_sex
#'
#' @return a graph
#' @export
#'
#' @examples
#' \dontrun{
#' draw_a_name(the_name,the_sex)
#' }
draw_a_name <- function(the_name,the_sex){
  prenoms %>%
    filter(name == the_name,sex == the_sex) %>%
    group_by(year) %>%
    summarise(n=sum(n,na.rm=TRUE)) %>%
    ggplot(aes(year,n)) + geom_line() +
    ggtitle(paste(the_name)) + ggthemes::theme_gdocs()

}
