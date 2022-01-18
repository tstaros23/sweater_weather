require 'rails_helper'

 RSpec.describe ActivityFacade do
   it "gets an activity based off of weather", :vcr do
     type = 'recreational'
     activity_info = ActivityFacade.activity_search(type)

     expect(activity_info).to be_a Array
   end
 end
