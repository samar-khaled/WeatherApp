# WeatherApp

A simple weather app that can take a location input, then display some details about the weather. 

Has the following user stories:
STORY-1: As a user, I can enter my location into the app. There should be an input field allowing a user to enter a location (a City/state/country/zipcode/etc) into the app.

STORY-2: As a user, I have a button to retrieve weather info for an entered location. There should be a button labeled "Go!", "Show", or similar which uses the input location from STORY-1 to retrieve weather for the given location. 

STORY-3: As a user, I can see the weather conditions for a location for the next 14 days. Using the data retrieved by the action in STORY-2, there needs to be a display of that location's current weather conditions. The attributes that should be included are at least:
* Temperature (in F)
* Pressure
* Humidity
* Current condition (sun, clouds, rain, fog,etc)
* Chance of precipitation

STORY-4: As a user, I can refresh to see the weather for the entered location I should be able to pull and refresh the list.

STORY-5: As a user, I can see the input location on a small map view The map can be either a static map image centered on the location, or some live map component (google maps, open street maps, etc).

Notes:
- The app using *rapidapi* that reterive data from Open Weather Map API https://openweathermap.org/forecast5
- I couldn't find an API that get 14 days for free, this API get 5 day / 3 hour forecast data
- Most of the app layout is done programatically, just one view was using Nib files.
- There are units testing and UI testing however for time constrain I couldn't make all the unit testing
- The app files are grouped by model in folders.
- I didn't have time to do the following:
    * Data loading: making data loader (WeatherService) protocol based  to enable implementing different loaders for different sources (servers, database, Testing mocks, …etc ).
