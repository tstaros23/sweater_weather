require 'rails_helper'

 RSpec.describe 'can get activity data' do
   it "can return all activity data and forecast for a location", :vcr do
     get '/api/v1/activities', params: {location: 'chicago,il', type: 'recreational'}
     
     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     activity_data = JSON.parse(response.body, symbolize_names: true)


     expect(activity_data).to have_key(:data)
     expect(activity_data[:data]).to be_a(Hash)
   end
 end
