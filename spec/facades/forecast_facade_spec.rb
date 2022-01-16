require 'rails_helper'

 RSpec.describe ForecastFacade, :vcr do
   it "gets weather based off of longitude and latitude" do
     forecast_info = ForecastFacade.forecast_search('Denver,CO')
     expect(forecast_info[:current]).to be_a Hash
   end
 end
