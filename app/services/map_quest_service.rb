class MapQuestService < BaseService
  def self.get_service(address)
     response = conn().get do |f|
       f.params['location'] = address
       f.params[] = ENV["map_quest_key"]
     end
     get_json(response)
   end
end
