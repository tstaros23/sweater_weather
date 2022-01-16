require 'rails_helper'

 RSpec.describe DailyWeather do
   it "builds daily weather forecasts and attributes" do

     attr =
       {
       dt: 1642225439,
       sunrise: 1642169966,
       sunset: 1642204693,
       temp: {
         max: 38.66,
         min: 26.46
       },
       weather: [
         {
           description: "clear sky",
           icon: "04n"
         }
       ]
     }


     daily_weather = DailyWeather.new(attr)

     expect(daily_weather).to be_a(DailyWeather)

     expect(daily_weather.date).to eq("2022-01-14")
     expect(daily_weather.date.class).to eq(String)

     expect(daily_weather.sunrise).to eq("2022-01-14 07:19:26 -0700")
     expect(daily_weather.sunrise.class).to eq(String)

     expect(daily_weather.sunset).to eq("2022-01-14 16:58:13 -0700")
     expect(daily_weather.sunset.class).to eq(String)

     expect(daily_weather.max_temp).to eq(38.66)
     expect(daily_weather.max_temp.class).to eq(Float)

     expect(daily_weather.min_temp).to eq(26.46)
     expect(daily_weather.min_temp.class).to eq(Float)

     expect(daily_weather.conditions).to eq("clear sky")
     expect(daily_weather.conditions.class).to eq(String)

     expect(daily_weather.icon).to eq("04n")
     expect(daily_weather.icon.class).to eq(String)

     expect(daily_weather.id).to eq(nil)
     expect(daily_weather.id.class).to eq(NilClass)
   end
 end
