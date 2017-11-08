# Data Mining using Twitter API
# Data is being searched and stored on MySQL Server

library(ROAuth)
library(twitteR)

searchPhrase <- readline("Type search phrase: ")
postRequest <- as.numeric(readline("Requested amount of reviews: "))

authentification <- function() {
 # Twitter API requests authentification by the program
    key="***KEY***"
    secret="***SECRET***"
    access_token = "***ACCESSTOKEN***"
    access_secret = "***ACCESSSECRET***"

    authenticate <- OAuthFactory$new(consumerKey=key,
                                 consumerSecret=secret,
                                 requestURL="https://api.twitter.com/oauth/request_token",
                                 accessURL="https://api.twitter.com/oauth/access_token",
                                 authURL="https://api.twitter.com/oauth/authorize")

    setup_twitter_oauth(key, secret, access_token, access_secret)
}

searchFunction <- function(arg1, arg2, arg3, arg4) {
 # function searches Twitter
    searchResult <- searchTwitter(arg1, since = arg2, until = arg3, n = arg4)
}

databaseFunction <- function(arg1, arg2, arg3, arg4) {
 # function saves data on database
    register_mysql_backend(arg1, arg2, arg3, arg4)
    store_tweets_db(result, table_name=paste(searchPhrase, "Twitter", sep = "_", collapse = NULL))
}

authentification()
result <- searchFunction(searchPhrase, "2006-03-06", as.character(Sys.Date()), postRequest)
databaseFunction("API_Project", 'localhost', 'Me', '***PASSWORD***')
