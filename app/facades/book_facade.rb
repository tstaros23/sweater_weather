class BookFacade
  def self.book_search(location)
    book_data = BookService.get_book(location)

    stuff = book_data[:docs].map do |data|
      Book.new(data)
    end
  end
  def self.count_books(location)
    BookService.get_book(location)[:numFound]
  end
end
