require 'rails_helper'

 RSpec.describe CurrentWeather do
   it "builds appropriate forecasts and attributes" do

       attr =
             {
               current_weather: {
                              datetime: "2020-09-30 13:27:03 -0600",
                              sunrise: "2020-09-30 06:27:03 -0600",
                              temperature: 79.4,
                              feels_like: 26.46,
                              humidity: 70,
                              visibility: 10000,
                              conditions: "overcast clouds"
                                }
             }
     current = CurrentWeather.new(temperature, feels_like)

     expect(current).to be_a(CurrentWeather)
     expect(current.temperature).to be(79.4)
     expect(current.feels_like).to eq(26.46)
   end
 end
