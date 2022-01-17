require 'rails_helper'

 RSpec.describe Background do
   it "builds an appropriate background picture" do
     attr = {
       urls: {
         raw: "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE3ODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDIzODM1NzM&ixlib=rb-1.2.1"
       },
       user: {
         name: "Dillon Wanner",
         portfolio_url: "https://dillydally.myportfolio.com"
       },
       links: {
         self:"https://api.unsplash.com/users/dillydallying"
       }

     }
     location = "denver,co"
     background = Background.new(attr, location)

     expect(background.url).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE3ODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDIzODM1NzM&ixlib=rb-1.2.1")
     expect(background.url.class).to eq(String)

     expect(background.author_name).to eq("Dillon Wanner")
     expect(background.author_name.class).to eq(String)

     expect(background.author_portfolio).to eq("https://dillydally.myportfolio.com")
     expect(background.author_portfolio.class).to eq(String)

     expect(background.author_profile_url).to eq("https://api.unsplash.com/users/dillydallying")
     expect(background.author_profile_url.class).to eq(String)

     expect(background.location).to eq(location)
     expect(background.location.class).to eq(String)

     expect(background.source).to eq('unsplash.com')
     expect(background.source.class).to eq(String)

     expect(background.id).to eq(nil)
     expect(background.id.class).to eq(NilClass)
   end
 end
