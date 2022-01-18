require 'rails_helper'

 RSpec.describe 'retrieve endpoint' do
   it "can get activities", :vcr do
     json = ActivityService.get_activity("recreational")

     expect(json).to be_a(Hash)
   end
 end
