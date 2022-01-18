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

   title = 'denver,co'
   book = Book.new(attr)

   expect(book.title).to eq("Chicago, Il Vicinity")
   expect(book.isbn).to eq(["9780762521920","0762521929"])
   expect(book.publisher).to eq(["Universal Map Enterprises"])
   end
 end
