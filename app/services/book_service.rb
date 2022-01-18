class BookService < BaseService
  def self.get_book(title)
     response = conn('https://openlibrary.org/search.json').get do |f|
       f.params['q'] = title
     end
     get_json(response)
   end
end
