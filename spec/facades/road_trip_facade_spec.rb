require 'rails_helper'

 RSpec.describe RoadTripFacade do
   it "gets a route based off starting and end point", :vcr do
     start = 'denver,co'
     finish = 'seattle,wa'
     road_trip_info = RoadTripFacade.road_trip_info(start,finish)

     expect(road_trip_info).to be_an_instance_of(RoadTrip)
   end
 end
