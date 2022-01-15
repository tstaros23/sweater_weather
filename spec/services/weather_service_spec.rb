require 'rails_helper'

 RSpec.describe WeatherService do
   it "can get the weather forecast", :vcr do

     json = WeatherService.get_weather(39.738453,-104.984853)

     expect(json).to be_a(Hash)
     expect(json).to have_key(:current)
     expect(json[:current]).to be_a(Hash)
     expect(json[:current]).to have_key(:dt)
     expect(json[:current]).to have_key(:sunrise)
     expect(json[:current]).to have_key(:sunset)
     expect(json[:current]).to have_key(:temp)
     expect(json[:current]).to have_key(:feels_like)
     expect(json[:current]).to have_key(:humidity)
     expect(json[:current]).to have_key(:uvi)
     expect(json[:current]).to have_key(:visibility)
     expect(json[:current]).to have_key(:weather)
     expect(json[:current][:weather][0]).to have_key(:description)
     expect(json[:current][:weather][0]).to have_key(:icon)

     expect(json).to have_key(:daily)
     expect(json[:daily]).to be_a(Array)
     expect(json[:daily][0]).to have_key(:dt)
     expect(json[:daily][0]).to have_key(:sunrise)
     expect(json[:daily][0]).to have_key(:sunset)
     expect(json[:daily][0]).to have_key(:temp)
     expect(json[:daily][0][:temp]).to have_key(:min)
     expect(json[:daily][0][:temp]).to have_key(:max)
     expect(json[:daily][0]).to have_key(:weather)
     expect(json[:daily][0][:weather][0]).to have_key(:description)
     expect(json[:daily][0][:weather][0]).to have_key(:icon)

     expect(json).to have_key(:hourly)
     expect(json[:hourly]).to be_a(Array)
     expect(json[:hourly][0]).to have_key(:dt)
     expect(json[:hourly][0]).to have_key(:temp)
     expect(json[:hourly][0]).to have_key(:weather)
     expect(json[:hourly][0][:weather][0]).to have_key(:description)
     expect(json[:hourly][0][:weather][0]).to have_key(:icon)
   end
 end
