# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

whichflight<-function(param="UA"){
  # a param?ter ?gy cser?lhet?, hogy
  # http://localhost:5602/echo?param=DL
  # a ?param= ut?n ?rjuk a megfelel? cuccot

  flights<-data.table::as.data.table(nycflights13::flights)


  # a hi?nyz? adatokat kiszedem, mert nincs ?rtelme azokat ?tlagolni
  flights<-flights[rowSums(is.na(flights))==0,]
  x<-flights[carrier == param,.(mean_arr_delay=mean(arr_delay),mean_dep_delay=mean(dep_delay))]
  y<-paste0(param, " carrier ", colnames(x)[1]," ", x[[1]], " min",", ", colnames(x)[2]," ", x[[2]], " min")
  #x<-flights[carrier == param,.(mean_arr_delay=mean(arr_delay),mean_dep_delay=mean(dep_delay)), by = flight]
  #x<-x[order(flight)]
  return(y)
  #flights[rowSums(is.na(flights))==0,]
}