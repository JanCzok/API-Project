# Data Mining using Facebook API
# Data is being searched and stored on MySQL Server

library("Rfacebook")
library("RMySQL")

searchPhrase <- readline("Type search phrase: ")
pageRequest <- as.numeric(readline("Requested amount of pages: "))

# my_oauth is auth file created during API registration
load("my_oauth")

searchFunction <- function(){
 # function searches Facebook
 # returns full page information
 searchPages <- searchPages(searchPhrase, token = my_oauth, pageRequest)
}

# searches for posts in each page and adds to list
posts = list()
for (i in 1:length(pageResult))
{
posts = append(posts, getPage(pageResult$id[i], token = my_oauth, n = pageRequest, reactions = TRUE, verbose = TRUE))
}

databaseFunction <- function(arg1, arg2, arg3, arg4) {
 # saves table on database
 connection = dbConnect(RMySQL::MySQL(), dbname = arg1, username = arg2, password = arg3, host = arg4)
 dbWriteTable(connection, name = "Facebook", value = posts, override = TRUE) 
}

auth <- authentification()
pageResult <- searchFunction()
databaseFunction("Facebook", 'Me', '***PASSWORD***', 'localhost')
