# youtubemap



resources:

Leaflet / Shiny integration: https://rstudio.github.io/leaflet/shiny.html

YouTube API stuff:
https://developers.google.com/youtube/v3/docs/videos/list
API key: "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"


example call that works!

https://www.googleapis.com/youtube/v3/search?part=snippet&location=47.6550%2C-122.3080&locationRadius=5km&maxResults=5&q=meme&type=video&key=AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI
https://www.googleapis.com/youtube/v3/videos?part=snippet&location=29.7604%2-95.3698&locationRadius=5km&maxResults=20&q=meme+memez&fields=items&key=AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI


### Shiny APP functions

- radius
- radius unit ("km" or "mi" in radio buttons)
- num of results
- search items
- toggle between searching/clicking and most popular videos
  - panels / nav bar type thing?



### MAP functions
##### leaflet / mapbox

- clickable points on the map to see link, details about the video
- potenially showing charts of the X num of videos that are in that area
- preview clips?
- clicking on the maps gets a geolocation pointer, sends to the UI for input$location
