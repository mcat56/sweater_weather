# Sweater Weather

## Description
Sweater Weather is a Rails web JSON API with POSTGRES db that exposes endpoints for forecast weather by destination, registering new users, logging in existing users, and providing road trip forecast and travel time information for users who have valid API keys. 

## Setup
* Clone this repository
* $ bundle
* Test: $ rspec

## Endpoints

### Forecast
get:   https://sweater-weather-123.herokuapp.com/api/v1/road_trip

    GET /api/v1/forecast?location=denver,co
    Content-Type: application/json
    Accept: application/json

### Background Image
get:    https://sweater-weather-123.herokuapp.com/api/v1/backgrounds
     ```GET /api/v1/backgrounds?location=denver,co
     Content-Type: application/json
     Accept: application/json``` 
    
### Register User
post:   https://sweater-weather-123.herokuapp.com/api/v1/users
    ```POST /api/v1/users
    Content-Type: application/json
    Accept: application/json```

    {
      "email": "whatever@example.com",
      "password": "password"
      "password_confirmation": "password"
    }
 
### Login User
post:   https://sweater-weather-123.herokuapp.com/api/v1/sessions
    ```POST /api/v1/sessions
    Content-Type: application/json
    Accept: application/json```

    {
      "email": "whatever@example.com",
      "password": "password"
    }

### RoadTrip
post:   https://sweater-weather-123.herokuapp.com/api/v1/road_trip
    ```POST /api/v1/road_trip
       Content-Type: application/json
       Accept: application/json```

    body:

    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  
 
  ## Responses 
  
  ### Forecast
  
      {
        "data": {
            "id": null,
            "type": "forecast",
            "attributes": {
                "id": null,
                "hourly_forecast": [
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 25,
                        "temperature": 37,
                        "time": "07 PM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 29,
                        "temperature": 34,
                        "time": "08 PM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 37,
                        "temperature": 31,
                        "time": "09 PM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 41,
                        "temperature": 29,
                        "time": "10 PM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 43,
                        "temperature": 28,
                        "time": "11 PM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 43,
                        "temperature": 26,
                        "time": "12 AM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 42,
                        "temperature": 26,
                        "time": "01 AM"
                    },
                    {
                        "summary": "Clear",
                        "icon": "clear-night",
                        "humidity": 42,
                        "temperature": 26,
                        "time": "02 AM"
                    }
                ],
                "daily_forecast": {
                    "today": "Clear throughout the day.",
                    "high": 46,
                    "low": 22,
                    "tonight": "Clear",
                    "icon": "clear-day"
                },
                "current_weather": {
                    "summary": "Clear",
                    "uvIndex": 0,
                    "icon": "clear-night",
                    "time": "07:33 PM, 01/13",
                    "temperature": 36,
                    "humidity": 27,
                    "feels_like": 33,
                    "visibility": 10.0
                }
            }
        }
    } 
    
 ### Backgrounds
 
     {
        "data": {
            "id": null,
            "type": "background",
            "attributes": {
                "id": null,
                "background": {
                    "id": null,
                    "image_url": "https://images.pexels.com/photos/3153198/pexels-photo-    3153198.jpeg?auto=compress&cs=tinysrgb&h=350"
                }
            }
        }
    }
 
 
 ### Register
 
      {"api_key":"AWAI0h3i7tGsrPSwpX24vmqZk5Sdt5JCd28u"}   
  
 ### Login
 
      {"api_key":"AWAI0h3i7tGsrPSwpX24vmqZk5Sdt5JCd28u"}
  
  ### Roadtrip
      {
        "data": {
            "id": null,
            "type": "roadtrip",
            "attributes": {
                "id": null,
                "travel_time": "1 hour 48 mins",
                "arrival_forecast": {
                    "summary": "Clear",
                    "temperature": 19
                },
                "origin": "denver,co",
                "destination": "pueblo,co"
            }
        }
    }



















## Versions
- Ruby 2.6.3
- Rails 5.2.4
