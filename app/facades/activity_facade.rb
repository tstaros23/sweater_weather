class ActivityFacade
  def self.activity_search(type)
    activity_data = ActivityService.get_activity(type)

    stuff = activity_data.map do |data|
      Activity.new(data)
    end
  end
end
