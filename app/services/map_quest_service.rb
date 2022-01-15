class MapQuestService < BaseService
  def self.get_geocode(address)
     response = conn('http://www.mapquestapi.com/geocoding/v1/address').get do |f|
       f.params['location'] = address
       f.params['key'] = ENV["map_quest_key"]
     end
     get_json(response)
   end
end
