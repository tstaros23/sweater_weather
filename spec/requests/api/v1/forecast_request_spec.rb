require 'rails_helper'

 RSpec.describe 'index', type: :request  do
   it "can return all forecast data for location", :vcr do
     get '/api/v1/forecast', params: {location: 'denver,co'}

     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     forecast_data = JSON.parse(response.body, symbolize_names: true)

     expect(forecast_data[:data]).to have_key(:id)
     expect(forecast_data[:data]).to have_key(:type)
     expect(forecast_data[:data][:type]).to eq('forecast')
     expect(forecast_data[:data]).to have_key(:attributes)
     expect(forecast_data[:data][:attributes]).to have_key(:current_weather)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:datetime)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:sunrise)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:sunset)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:temperature)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:feels_like)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:humidity)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:uvi)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:visibility)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:conditions)
     expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:icon)

     expect(forecast_data[:data][:attributes]).to have_key(:daily_weather)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:date)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).to have_key(:icon)

     expect(forecast_data[:data][:attributes]).to have_key(:hourly_weather)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).to have_key(:time)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
   end

   it "should not return this forecast data for users", :vcr do
     get '/api/v1/forecast', params: {location: 'denver,co'}

     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     forecast_data = JSON.parse(response.body, symbolize_names: true)

     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:pressure)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:dt)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:temp)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:dew_point)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:clouds)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:wind_speed)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:wind_deg)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:wind_gust)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:weather)
     expect(forecast_data[:data][:attributes][:current_weather]).not_to have_key(:pop)

     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:dt)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:moonrise)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:moonset)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:moonphase)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:temp)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:feels_like)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:pressure)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:humidity)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:dew_point)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:wind_speed)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:wind_deg)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:wind_gust)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:weather)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:cloud)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:pop)
     expect(forecast_data[:data][:attributes][:daily_weather][0]).not_to have_key(:uvi)

     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:dt)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:temp)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:feels_like)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:pressure)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:humidity)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:dew_point)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:visibility)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:wind_deg)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:wind_gust)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:weather)
     expect(forecast_data[:data][:attributes][:hourly_weather][0]).not_to have_key(:pop)
   end
 end
