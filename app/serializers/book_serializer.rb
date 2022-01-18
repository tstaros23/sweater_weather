class BookSerializer
  def self.format_json(current, location, quantity, book)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: current.conditions,
            temperature: "#{current.temperature} F"
        },
        total_books_found: 5,
        books: format_books(book)
        }
      }
    }
  end

  def self.format_books(book)
    {
      isbn: book.isbn,
      title: book.title,
      publisher: book.publisher
    }
  end
end
