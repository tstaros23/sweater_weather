# 
Sweater Weather
----------------------------------------
### Ted Staros

![Ruby](https://img.shields.io/badge/Ruby-v2.7.2-red)

![Rails](https://img.shields.io/badge/Rails-v5.2.6-red)

#### Sweater Weather is a service-oriented architecture application that allows the front-end to communicate with the back-end through an API. This is the backend repository. This backend application exposes API that satisfies the front-end team's requirements.

## 
Tech Stack:
----------------------------------------
- Rails 5.2.6
- Ruby 2.7.2
- PostgreSQL
- RSpec
- Postman

##
Setup
----------------------------------------
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
###
Forecast
----------------------------------------

```
   GET forecast?location={location} 
```
* The location in the query of this endpoint can be any location that you want the forecast information
* This will return a collection of weather objects for the next 5 days as well as hourly weather for the next 8 hours.
* An example of a response will look like:
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-09-28 13:31:36 -0700",
                "conditions": "clear sky",
                "temperature": 89.9,
                "humidity": 36,
                "feels_like": 89.3,
                "uvi": 5.43,
                "visibility": 10000,
                "sunrise": "2021-09-28 06:29:56 -0700",
                "sunset": "2021-09-28 18:25:47 -0700"
            },
            "daily_weather": [
                {
                    "date": "2021-09-29",
                    "sunrise": "2021-09-29 06:30:40 -0700",
                    "sunset": "2021-09-29 18:24:22 -0700",
                    "max_temp": 86.7,
                    "min_temp": 72.3,
                    "conditions": "overcast clouds",
                    "icon": "http://openweathermap.org/img/w/04d.png"
                },
                { ... }
            ],
            "hourly_weather": [
                {
                    "time": "14:00:00",
                    "temperature": 89.9,
                    "conditions": "clear sky",
                    "icon": "http://openweathermap.org/img/w/01d.png"
                },
                { ... }
            ]
        }
    }
}
```
