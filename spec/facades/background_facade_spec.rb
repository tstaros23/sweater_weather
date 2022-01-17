require 'rails_helper'

 RSpec.describe BackgroundFacade do
   it "gets an image based off of location", :vcr do
     location = 'denver,co'
     background_info = BackgroundFacade.image_search(location)

     expect(background_info).to be_a Array
   end
 end
