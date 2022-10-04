
Sweater Weather
----------------------------------------
### Ted Staros

![Ruby](https://img.shields.io/badge/Ruby-v2.7.2-red)
![Rails](https://img.shields.io/badge/Rails-v5.2.6-red)
---

Sweater Weather is a trip planning app that helps you determine whether or not you'll need a sweater. This backend component is designed to consume multiple external APIs for our front end to use. 

## Architecture
This app uses a service-oriented architecture, with seperate frontend and backend rails applications. This is the **backend** repository. Users of Sweater Weather don't interact with this repository directly, but rather through the frontend app. The backend application is responsible for making API calls to the APIs listed below, formatting that data, and making that data available through several endpoints to be consumed by the frontend.


## Tech Stack:
- Rails 5.2.6
- Ruby 2.7.2
- PostgreSQL
- RSpec
- Postman

##
Setup
* Clone or Fork this repository
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`
* Sign up for the necessary API links. I have linked them at the bottom of the document.
* On the command line, run `bundle exec figaro install`
* This will create an `application.yml` file to keep your API keys secret
* Add the following lines to your `application.yml` file, replacing {key} and {secret} with the information from your API key you are provided from the API link:
   ```
   open_weather_api: {key}
   unsplash_key: {key}
   mapquest_api_key: {key}
   ```
* Run your development server with `rails s`, to see the application run.
##
Endpoints
----------------------------------------

* Backend API base path:
```
   http://localhost:3000/api/v1/{query}
```
* Query needs to be reqplaced by one of the endpoints listed below:
#### 1. Forecast

```ruby
   GET forecast?location={a location you'd like forecast information}
```   
Returns a collection of weather objects, including current, hourly, and daily forecasts. Daily forecasts are limited to the next five days, and hourly forecasts are for the next 8 hours
Example response:
```
   {
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-01-18T13:06:06.000-08:00",
                "sunrise": "2022-01-18T06:49:40.000-08:00",
                "sunset": "2022-01-18T16:51:59.000-08:00",
                "temp": 58.77,
                "feels_like": 56.32,
                "humidity": 42,
                "uvi": 2.2,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01d"
            },
            "daily_weather": [
                {
                    "date": "2022-01-18T11:00:00.000-08:00",
                    "sunrise": "2022-01-18T06:49:40.000-08:00",
                    "sunset": "2022-01-18T16:51:59.000-08:00",
                    "max_temp": 58.77,
                    "min_temp": 49.19,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-01-19T11:00:00.000-08:00",
                    "sunrise": "2022-01-19T06:49:17.000-08:00",
                    "sunset": "2022-01-19T16:53:00.000-08:00",
                    "max_temp": 61.07,
                    "min_temp": 45.75,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    Same format for Days 3 .. 5
                },
            ],
            "hourly_weather": [
                {
                    "time": "2022-01-18T13:00:00.000-08:00",
                    "tempature": 58.77,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    Same format for Hours 2 .. 8
                }
            ]
        }
    }
}
```
#### 2. Backgrounds

```ruby
   GET backgrounds?location={a location you'd like an image for}
```   
Returns the first photo from Unplash's image search API using the query parameter provided. It includes the credit information required by Unsplash's terms of use.
Example response:
```
{
    "data": {
        "id": "null",
        "type": "image",
        "attributes": {
            "image": {
                "location": "Nevada, USA",
                "image_url": "https://images.unsplash.com/photo-1600072094117-8f283f7fb96a?ixid=MnwyOTE1MTZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NDI1NDAyNjE&ixlib=rb-1.2.1",
                "credits": {
                    "source": "unsplash.com",
                    "author": "liferondeau",
                    "author_url": "https://unsplash.com/@liferondeau"
                }
            }
        }
    }
}
```
#### 3. User Registration

```ruby
   POST users
   {
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
   }

```   
Allows users to register with the app and generates a unique API key for them. User information must be received as JSON in the body of the request.
Example response:
```
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "email": "whatever2@example.com",
            "api_key": "R8i9v1fR2ubVN2VW87o9GQtt"
        }
    }
}
```
#### 4. User Login

```ruby
   POST sessions
   {
  "email": "whatever@example.com",
  "password": "password"
   }
```   
Checks user credentials and allows them to log in. The information must be received as JSON in the body of the request.
Example response:
```
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "email": "whatever2@example.com",
            "api_key": "R8i9v1fR2ubVN2VW87o9GQtt"
        }
    }
}
```
#### 5. Road Trip

```ruby
   POST road_trip
   {
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "9okGIqb8wPSdqlyOZhw2ngtt"
   }
```   
Returns the travel time from the origin to the destination. Also returns the forecasted weather, including temperature and conditions, for the arrival time. The origin, destination, and api_key must be passed in the body of the request and be JSON formatted.
Example response:
```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01:45:23",
            "weather_at_eta": {
                "temp_at_eta": 51.17,
                "conditions": "overcast clouds"
            }
        }
    }
}
```

## APIs

I used 3 different APIs in this project. They are listed below:
1. [Open Weather's One Call](https://openweathermap.org/api/one-call-api)
2. [Mapquest API](https://developer.mapquest.com/documentation/)
3. [Unsplash API](https://unsplash.com/documentation#getting-started)

All of the above require the use of API keys. To aquire your own keys, please visit the linked sites to get started.
