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
* Query needs to be reqplaced by the endpoints listed below:
###
Forecast
