require 'rails_helper'

 RSpec.describe 'can get all background data' do
   it "can return all background data for a location" do
     get '/api/v1/backgrounds', params: {location: 'denver,co'}

     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     background_data = JSON.parse(response.body, symbolize_names: true)
   end
 end
