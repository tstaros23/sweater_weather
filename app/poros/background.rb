class Background
  attr_reader :id, :url, :author_name, :author_portfolio, :author_profile_url, :location, :source
  def initialize(attr, location)
    @url = attr[:urls][:raw]
    @author_name = attr[:user][:name]
    @author_portfolio = attr[:user][:portfolio_url]
    @author_profile_url = attr[:links][:self]
    @location = location
    @source = 'unsplash.com'
  end
end
