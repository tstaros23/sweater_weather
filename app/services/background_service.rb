class BackgroundService < BaseService
  def self.get_image(location)
     response = conn('https://api.unsplash.com/search/photos').get do |f|
       f.params['query'] = location
       f.params['per_page'] = 1
       f.params['client_id'] = ENV["background_access_key"]
     end
     get_json(response)
   end
end
