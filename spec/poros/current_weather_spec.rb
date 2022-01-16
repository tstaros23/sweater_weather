require 'rails_helper'

 RSpec.describe CurrentWeather do
   it "builds appropriate current weather forecasts and attributes" do

       attr = {
                              dt: 1642225439,
                              sunrise: 1642169966,
                              sunset: 1642204693,
                              temp: 79.4,
                              feels_like: 26.46,
                              humidity: 70,
                              visibility: 10000,
                              uvi: 0,
                              weather: [
                                {
                                  description: "overcast clouds",
                                  icon: "04n"
                                }
                              ]
                                }
     current_weather = CurrentWeather.new(attr)

     expect(current_weather).to be_a(CurrentWeather)

     expect(current_weather.datetime).to eq("2022-01-14 22:43:59 -0700")
     expect(current_weather.datetime.class).to eq(String)

     expect(current_weather.sunrise).to eq("2022-01-14 07:19:26 -0700")
     expect(current_weather.sunrise.class).to eq(String)

     expect(current_weather.sunset).to eq("2022-01-14 16:58:13 -0700")
     expect(current_weather.sunset.class).to eq(String)

     expect(current_weather.humidity).to eq(70)
     expect(current_weather.humidity.class).to eq(Float)

     expect(current_weather.visibility).to eq(10000)
     expect(current_weather.visibility.class).to eq(Integer)

     expect(current_weather.temperature).to eq(79.4)
     expect(current_weather.temperature.class).to eq(Float)

     expect(current_weather.feels_like).to eq(26.46)
     expect(current_weather.feels_like.class).to eq(Float)

     expect(current_weather.conditions).to eq("overcast clouds")
     expect(current_weather.conditions.class).to eq(String)

     expect(current_weather.uvi).to eq(0)
     expect(current_weather.uvi.class).to eq(Integer)

     expect(current_weather.icon).to eq("04n")
     expect(current_weather.icon.class).to eq(String)

     expect(current_weather.id).to eq(nil)
     expect(current_weather.id.class).to eq(NilClass)

   end
 end
