class Book
  attr_reader :title, :isbn, :publisher
  def initialize(attr)
    @title = attr[:title]
    @isbn = attr[:isbn]
    @publisher = attr[:publisher]
  end
end
