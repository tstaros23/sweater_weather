require 'rails_helper'

 RSpec.describe MapQuestService, :vcr do
   it "can get the geocode" do
     json = MapQuestService.get_geocode("Denver,CO")

     expect(json[:info]).to be_a(Hash)
     expect(json[:info]).to have_key(:statuscode)
     expect(json[:info]).to have_key(:copyright)
     expect(json[:info]).to have_key(:messages)
     expect(json[:info][:copyright]).to have_key(:text)
     expect(json[:info][:copyright]).to have_key(:imageUrl)
     expect(json[:info][:copyright]).to have_key(:imageAltText)
   end
 end
