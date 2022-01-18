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
        total_books_found: book.count,
        books: book.map do |obj|
          {
            isbn: obj.isbn,
            title: obj.title,
            publisher: obj.publisher
          }
        end
        }
      }
    }
  end
end
