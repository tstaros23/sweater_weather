require 'rails_helper'

 RSpec.describe RoadTrip do
   it "can build a route with the appropriate attributes" do
     attr = {
            start_city: "Denver, CO",
            end_city: "Estes Park, CO",
            travel_time: "2 hours, 13 minutes",
            weather_at_eta: {
              temperature: 59.4,
              conditions: "partly cloudy with a chance of meatballs"
            }
          }

       road_trip = RoadTrip.new(attr)

       expect(road_trip.start_city).to eq("Denver, CO")
       expect(road_trip.end_city).to eq("Estes Park, CO")
       expect(road_trip.travel_time).to eq("2 hours, 13 minutes")
       expect(road_trip.weather_at_eta).to eq(attr[:weather_at_eta])
   end
 end
