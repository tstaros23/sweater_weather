require 'rails_helper'

 RSpec.describe RoadTripFacade do
   it "gets a route based off starting and end point", :vcr do
     start = 'denver,co'
     finish = 'seattle,wa'
     road_trip_info = RoadTripFacade.road_trip_info(start,finish)

     expect(background_info).to be_a Hash
   end
 end
