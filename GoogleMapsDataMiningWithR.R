# Data Mining using Google Maps API
# Data is being searched and stored on MySQL Server

library("maps")
library("googleway")

#authentification: String Code
myAPI = "***APIKEY***"

searchPhrase <- readline("Type search phrase: ")
pageRequest <- as.numeric(readline("Requested amount of pages: "))

searchByName <- function(){
 # search for results matching searchPhrase
 places = google_places(search_string = searchPhrase, location = NULL, radar = FALSE,
	radius = NULL, rankby = NULL, keyword = NULL, language = NULL,
	name = NULL, place_type = "establishment", price_range = NULL, open_now = NULL,
	page_token = NULL, simplify = TRUE, myAPI)
}

searchByLocation <- function(){
 # search for results matching search phrase in specific location
 # parameter location: specify longitude and latitude
 # parameter radius: specify radius in kilometers
 places = google_places(search_string = NULL, location = c(41.876465, -87.621887), radar = TRUE,
	radius = 100, rankby = NULL, keyword = NULL, language = NULL,
	name = searchPhrase, place_type = "store", price_range = NULL, open_now = NULL,
	page_token = NULL, simplify = TRUE, myAPI)
}
