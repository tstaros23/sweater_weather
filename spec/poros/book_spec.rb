require 'rails_helper'

 RSpec.describe Book do
   it "builds an appropriate book" do
     attr = {
       title: "Chicago, Il Vicinity",
       isbn: [
         "9780762521920",
                "0762521929"
       ],
       publisher: [
         "Universal Map Enterprises"
       ]
     }
   end
 end
