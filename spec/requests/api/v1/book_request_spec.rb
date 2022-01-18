require 'rails_helper'

 RSpec.describe 'index', type: :request  do
   it "can return all forecast data for location", :vcr do
     get '/api/v1/book-search', params: {location: 'denver,co', quantity: 5}

     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     book_data = JSON.parse(response.body, symbolize_names: true)

     expect(book_data).to be_a(Hash)
   end
 end
