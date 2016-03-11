library(jsonlite)
library(dplyr)

#Returns the View count of a video given a certain video ID
getViewCount <- function(videoID) {
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics",
                "&id=", videoID,
                "&key=", key)
  data <- fromJSON(url)
  return(data$items$statistics$viewCount)
}

#Returns the Like count of a video given a certain video ID
getLikeCount <- function(videoID) {
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics",
                "&id=", videoID,
                "&key=", key)
  data <- fromJSON(url)
  return(data$items$statistics$likeCount)
}

#https://www.googleapis.com/youtube/v3/videos?part=statistics&id=2e3UhFodJK0&key=AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI

#Returns the Dislike count of a video given a certain video ID
getDislikeCount <- function(videoID) {
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics",
                "&id=", videoID,
                "&key=", key)
  data <- fromJSON(url)
  return(data$items$statistics$dislikeCount)
}

#Returns the Favorite count of a video given a certain video ID
getFavoriteCount <- function(videoID) {
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics",
                "&id=", videoID,
                "&key=", key)
  data <- fromJSON(url)
  return(data$items$statistics$favoriteCount)
}

#Returns the Comment count of a video given a certain video ID
getCommentCount <- function(videoID) {
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics",
                "&id=", videoID,
                "&key=", key)
  data <- fromJSON(url)
  return(data$items$statistics$commentCount)
}

getURL <- function(videoID) {
  return(paste0("https://www.youtube.com/watch?v=", videoID))
}

getImageURL <- function(videoID) {
  return(paste0("http://img.youtube.com/vi/", videoID, "/0.jpg"))
}