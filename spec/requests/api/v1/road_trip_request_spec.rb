require 'rails_helper'

 RSpec.describe 'road trip' do
   it "can send road trip information", :vcr do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       origin: 'Denver,CO',
       destination: 'Pueblo,CO',
       api_key: user.api_key
     }

     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/road_trip', params: body

     expect(response).to be_successful
     expect(response.status).to eq(200)

     road_trip_json = JSON.parse(response.body, symbolize_names: true)

     expect(road_trip_json).to have_key(:data)
     expect(road_trip_json[:data]).to be_a(Hash)
     expect(road_trip_json[:data]).to have_key(:type)
     expect(road_trip_json[:data][:type]).to eq('roadtrip')
     expect(road_trip_json[:data][:attributes]).to have_key(:start_city)
     expect(road_trip_json[:data][:attributes]).to have_key(:end_city)
     expect(road_trip_json[:data][:attributes]).to have_key(:travel_time)
     expect(road_trip_json[:data][:attributes]).to have_key(:weather_at_eta)
     expect(road_trip_json[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
     expect(road_trip_json[:data][:attributes][:weather_at_eta]).to have_key(:conditions)

   end

   it "sends a message that a route is impossible if the route does not exist", :vcr do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       origin: 'Denver,CO',
       destination: 'Sydney, Australia',
       api_key: user.api_key
     }

     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/road_trip', params: body

     expect(response).to be_successful
     expect(response.status).to eq(200)

     road_trip_json = JSON.parse(response.body, symbolize_names: true)

     expect(road_trip_json[:data][:attributes][:travel_time]).to eq("impossible route")
   end

   it "wont send information about road trip if user api key is invalid" do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       origin: 'Denver,CO',
       destination: 'Pueblo,CO',
       api_key: 'dfjadofjewofj'
     }

     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/road_trip', params: body

     road_trip_json = JSON.parse(response.body, symbolize_names: true)

     expect(response).not_to be_successful
     expect(response.status).to eq(401)

     expect(road_trip_json[:errors][:details]).to eq("Unauthorized")
   end
 end
