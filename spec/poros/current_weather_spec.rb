require 'rails_helper'

 RSpec.describe CurrentWeather do
   it "builds appropriate forecasts and attributes" do

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
                                description: "overcast clouds",
                                icon: "04n"
                              ]
                                }
     current = CurrentWeather.new(attr)

     expect(current).to be_a(CurrentWeather)

     expect(current.datetime).to eq("2022-01-14 22:43:59 -0700")
     expect(current.datetime.class).to eq(String)

     expect(current.sunrise).to eq("2022-01-14 07:19:26 -0700")
     expect(current.sunrise.class).to eq(String)

     expect(current.sunset).to eq("2022-01-14 16:58:13 -0700")
     expect(current.sunset.class).to eq(String)

     expect(current.humidity).to eq(70)
     expect(current.humidity.class).to eq(Float)

     expect(current.visibility).to eq(10000)
     expect(current.visibility.class).to eq(Integer)

     expect(current.temperature).to eq(79.4)
     expect(current.temperature.class).to eq(Float)

     expect(current.feels_like).to eq(26.46)
     expect(current.feels_like.class).to eq(Float)

     expect(current.conditions).to eq("overcast clouds")
     expect(current.conditions.class).to eq(String)

     expect(current.uvi).to eq(0)
     expect(current.uvi.class).to eq(Integer)

     expect(current.icon).to eq("04n")
     expect(current.icon.class).to eq(String)
   end
 end
