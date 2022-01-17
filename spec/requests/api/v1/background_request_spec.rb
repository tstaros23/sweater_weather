require 'rails_helper'

 RSpec.describe 'can get all background data', type: :request do
   it "can return all background data for a location", :vcr do
     get '/api/v1/backgrounds', params: {location: 'denver,co'}

     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     background_data = JSON.parse(response.body, symbolize_names: true)

     expect(background_data).to have_key(:data)
     expect(background_data[:data]).to have_key(:type)
     expect(background_data[:data]).to have_key(:id)
     expect(background_data[:data]).to have_key(:attributes)
     expect(background_data[:data][:attributes]).to have_key(:image)
     expect(background_data[:data][:attributes][:image]).to have_key(:location)
     expect(background_data[:data][:attributes][:image]).to have_key(:image_url)
     expect(background_data[:data][:attributes][:image]).to have_key(:credit)
     expect(background_data[:data][:attributes][:image][:credit]).to have_key(:source)
     expect(background_data[:data][:attributes][:image][:credit]).to have_key(:author)
   end

   it "should not return this image data for users", :vcr do
     get '/api/v1/backgrounds', params: {location: 'denver,co'}

     headers = { 'ACCEPT' => 'application/json'}
     expect(response.content_type).to eq('application/json')

     expect(response.status).to eq(200)
     expect(response).to be_successful

     background_data = JSON.parse(response.body, symbolize_names: true)

     expect(background_data).not_to have_key(:total)
     expect(background_data).not_to have_key(:total_page)
     expect(background_data).not_to have_key(:results)
     expect(background_data[:data]).not_to have_key(:created_at)
     expect(background_data[:data]).not_to have_key(:updated_at)
     expect(background_data[:data]).not_to have_key(:promoted_at)
     expect(background_data[:data]).not_to have_key(:width)
     expect(background_data[:data]).not_to have_key(:height)
     expect(background_data[:data]).not_to have_key(:color)
     expect(background_data[:data]).not_to have_key(:blur_hash)
     expect(background_data[:data]).not_to have_key(:description)
     expect(background_data[:data]).not_to have_key(:alt_description)
     expect(background_data[:data]).not_to have_key(:urls)
     expect(background_data[:data]).not_to have_key(:tags)
   end
 end
