require 'rails_helper'

 RSpec.describe 'user login' do
   it "can authenticate a user when they login" do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       email: user.email,
       password: user.password,
       password_confirmation: user.password
     }

     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/sessions', params: { email: "whatever@example.com", password: "password"}, as: :json

     json = JSON.parse(response.body, symbolize_names: true)

     expect(response.status).to eq(200)
     expect(response).to be_successful
     expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
     expect(json).to have_key(:data)
     expect(json[:data]).to have_key(:type)
     expect(json[:data][:type].class).to eq(String)
     expect(json[:data]).to have_key(:id)
     expect(json[:data][:id].class).to eq(String)
     expect(json[:data]).to have_key(:attributes)
     expect(json[:data][:attributes].class).to eq(Hash)
     expect(json[:data][:attributes]).to have_key(:email)
     expect(json[:data][:attributes][:email].class).to eq(String)
     expect(json[:data][:attributes]).to have_key(:api_key)
     expect(json[:data][:attributes][:api_key].class).to eq(String)
   end

   it "will not expose confidential data" do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       email: user.email,
       password: user.password,
       password_confirmation: user.password
     }

     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/sessions', params: {email: "tstaros23@gmail.com", password: "12345"}, as: :json

     json = JSON.parse(response.body, symbolize_names: true)

     expect(json).not_to have_key(:password)
     expect(json).not_to have_key(:password_confirmation)
     expect(json).not_to have_key(:password_digest)
   end

   it "gives an error if bad credentials are given" do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       email: "whatever@example.com",
       password: "boogers",
       password_confirmation: user.password
     }

     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/sessions', params: {}, as: :json

     json = JSON.parse(response.body, symbolize_names: true)

     expect(response.status).to eq(400)
     expect(response).not_to be_successful

     expect(json[:errors][:details]).to eq("Bad credentials")
   end
 end
