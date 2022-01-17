require 'rails_helper'

 RSpec.describe 'create endpoint' do
   it "can create a user" do
     body = {
       email: 'whatever@example.com',
       password: 'password',
       password_confirmation: 'password'
     }
     headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json'}

     post '/api/v1/users', params: body

     expect(response).to be_successful
     expect(response.status).to eq(201)

     user_json = JSON.parse(response.body, symbolize_names: true)

     expect(users_json).to have_key(:data)
     expect(user_json[:data]).to be_a(Hash)
     expect(user_json[:data]).to have_key(:id)
     expect(user_json[:data]).to have_key(:type)
     expect(user_json[:data][:type]).to eq("users")
     expect(user_json[:data][:attributes]).to have_key(:email)
     expect(user_json[:data][:attributes]).to have_key(:api_key)
   end

   it "returns an error if an email address already exists for user" do
     user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

     body = {
       email: 'whatever@example.com',
       password: 'password',
       password_confirmation: 'password'
     }
     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/users', params: body

     expect(response).not_to be_successful
     expect(response.status).to eq(400)
   end

   it "returns an error if passwords don't match" do

     body = {
       email: 'whatever@example.com',
       password: 'password',
       password_confirmation: 'passwordd'
     }
     headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

     post '/api/v1/users', params: body

     expect(response).not_to be_successful
     expect(response.status).to eq(400)
   end
 end
