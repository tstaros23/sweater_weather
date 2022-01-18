require 'rails_helper'

 RSpec.describe ActivityFacade do
   it "gets an activity based off of weather", :vcr do
     temp = 60
     activity_info = ActivityFacade.activity_search(temp)

     expect(activity_info).to be_a Array
   end
 end
