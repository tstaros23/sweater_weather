require 'rails_helper'

 RSpec.describe HourlyWeather do
   it "builds hourly weather attributes" do
     attr =
       {
       dt: 1642222800,
       temp: 26.73,
       weather: [
         {
           description: "overcast clouds",
           icon: "04n"
         }
       ]
     }
     hourly_weather = HourlyWeather.new(attr)

     expect(hourly_weather).to be_an_instance_of(HourlyWeather)

     expect(hourly_weather.time).to eq("22:00:00")
     expect(hourly_weather.time.class).to eq(String)

     expect(hourly_weather.temperature).to eq(26.73)
     expect(hourly_weather.temperature.class).to eq(Float)

     expect(hourly_weather.conditions).to eq("overcast clouds")
     expect(hourly_weather.conditions.class).to eq(String)

     expect(hourly_weather.icon).to eq("04n")
     expect(hourly_weather.icon.class).to eq(String)

     expect(hourly_weather.id).to eq(nil)
     expect(hourly_weather.id.class).to eq(NilClass)
   end
 end
