require 'rails_helper'

 RSpec.describe MapQuestService, :vcr do
   it "can get the geocode" do
     json = MapQuestService.get_geocode("Denver,CO")

     expect(json).to have_key(:results)
     expect(json[:results]).to be_a(Array)
     expect(json[:results][0]).to have_key(:locations)
     expect(json[:results][0][:locations]).to be_a(Array)
     expect(json[:results][0][:locations][0]).to have_key(:latLng)
     expect(json[:results][0][:locations][0][:latLng]).to have_key(:lat)
     expect(json[:results][0][:locations][0][:latLng]).to have_key(:lng)
     expect(json[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
     expect(json[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
     expect(json[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
     expect(json[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
   end
 end
