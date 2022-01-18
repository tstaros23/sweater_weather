RSpec.describe BookService do
  it "can get the book title", :vcr do
    title = "denver,co"
    json = BookService.get_book(title)

    expect(json).to be_a(Hash)
  end
end
