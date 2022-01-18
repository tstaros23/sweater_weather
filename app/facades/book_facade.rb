class BookFacade
  def self.book_search(title)
    book_data = BookService.get_book(title)
    stuff = book_data[:docs].map do |data|
      Book.new(data)
    end
  end
end
