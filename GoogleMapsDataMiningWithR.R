# Data Mining using Google Maps API
# Data is being searched and stored on MySQL Server

library("maps")
library("googleway")
library("RMySQL")

#authentification: String Code
myAPI = "***APIKEY***"

#user is asked to type in a search phrase
searchPhrase <- readline("Type search phrase: ")

searchByName <- function(){
 # search for results matching searchPhrase
 places = google_places(search_string = searchPhrase, location = NULL, radar = FALSE,
	radius = NULL, rankby = NULL, keyword = NULL, language = NULL,
	name = NULL, place_type = "establishment", price_range = NULL, open_now = NULL,
	page_token = NULL, simplify = TRUE, myAPI)
}

searchByLocation <- function(arg1, arg2, arg3, arg4){
 # search for results matching search phrase in specific location
 # parameter location: specify longitude and latitude
 # parameter radius: specify radius in kilometers
 places = google_places(search_string = NULL, location = c(arg1, arg2), radar = TRUE,
	radius = arg3, rankby = NULL, keyword = NULL, language = NULL,
	name = arg4, place_type = "store", price_range = NULL, open_now = NULL,
	page_token = NULL, simplify = TRUE, myAPI)
}

databaseFunction <- function(arg1, arg2, arg3, arg4, arg5) {
 # saves table on database
 # arg5 needs to be a data.frame
 connection = dbConnect(RMySQL::MySQL(), dbname = arg1, username = arg2, password = arg3, host = arg4)
 dbWriteTable(connection, name = "Google", value = arg5, override = TRUE) 
}

myResult <- searchByLocation(41.876465, -87.621887, 50000, searchPhrase)
databaseFunction("Google", 'Me', '***PASSWORD***', 'localhost', ***DATA.FRAME***)
