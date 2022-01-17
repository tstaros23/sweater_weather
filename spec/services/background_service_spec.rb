require 'rails_helper'

 RSpec.describe BackgroundService do
   it "can get the background image from a location", :vcr do
     location = "denver,co"
     json = BackgroundService.get_image(location)

     expect(json).to be_a(Hash)
   end
 end
