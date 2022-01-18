require 'rails_helper'

 RSpec.describe BookFacade do
   it "gets books based off of title", :vcr do
     title = 'denver,co'
     book_info = BookFacade.book_search(title)

     expect(book_info).to be_an_instance_of(Book)
   end
 end
