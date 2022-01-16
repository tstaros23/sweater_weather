require 'rails_helper'

 RSpec.describe ForecastFacade, :vcr do
   before(:each) do
     @location = 'Denver,CO'
   end

   it "gets weather based off of longitude and latitude" do
     forecast_info = ForecastFacade.forecast_search("#{@location}")
     expect(forecast_info[:current]).to be_a Hash
   end

   it "is an instance of current weather" do
     current_weather = ForecastFacade.create_current_weather("#{@location}")
     expect(current_weather).to be_an_instance_of(CurrentWeather)
   end

   it "is an instance of hourly weather" do
     hourly_forecast = ForecastFacade.create_hourly_weather("#{@location}")
     hourly_forecast.each do |forecast|
       expect(forecast).to be_an_instance_of(HourlyWeather)
     end
   end

   it "is an instance of daily weather" do
     daily_forecast = ForecastFacade.create_daily_weather("#{@location}")
     daily_forecast.each do |forecast|
       expect(foecast).to be_an_instance_of(DailyWeather)
     end
   end
 end
