require 'rails_helper'

 RSpec.describe BackgroundFacade do
   location = 'denver,co'
   background_info = BackgroundFacade.image_search(location)
   expect(background_info).to be_a Hash
 end
