require 'rails_helper'

 RSpec.describe ForecastFacade, :vcr do
   it "creates weather objects" do
     forecast_info = ForecastFacade.forecast_search('Denver,CO')
     forecast_info.each do |info|
       expect(info).to be_a(Forecast)
     end
   end
 end
