require 'rails_helper'

 RSpec.describe BackgroundService do
   it "can get the background image from a location", :vcr do
     location = "denver,co"
     json = BackgroundService.get_image(location)

     expect(json).to be_a(Hash)
     expect(json).to have_key(:total)
     expect(json).to have_key(:total_pages)
     expect(json).to have_key(:results)
     expect(json[:results][0]).to have_key(:id)
     expect(json[:results][0]).to have_key(:created_at)
     expect(json[:results][0]).to have_key(:updated_at)
     expect(json[:results][0]).to have_key(:promoted_at)
     expect(json[:results][0]).to have_key(:width)
     expect(json[:results][0]).to have_key(:height)
     expect(json[:results][0]).to have_key(:color)
     expect(json[:results][0]).to have_key(:blur_hash)
     expect(json[:results][0]).to have_key(:description)
     expect(json[:results][0]).to have_key(:alt_description)
     expect(json[:results][0]).to have_key(:urls)
     expect(json[:results][0]).to have_key(:links)
     expect(json[:results][0]).to have_key(:categories)
     expect(json[:results][0]).to have_key(:likes)
     expect(json[:results][0]).to have_key(:liked_by_user)
     expect(json[:results][0]).to have_key(:current_user_collections)
     expect(json[:results][0]).to have_key(:sponsorship)
     expect(json[:results][0]).to have_key(:topic_submissions)
     expect(json[:results][0]).to have_key(:user)
   end
 end
