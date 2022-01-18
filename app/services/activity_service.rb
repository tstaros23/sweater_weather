class ActivityService < BaseService
  def self.get_activity(type)
     response = conn('http://www.boredapi.com/api/activity').get do |f|
       f.params['type'] = type
     end
     get_json(response)
   end
end
