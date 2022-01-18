class ActivityFacade
  def self.activity_search(temp)
    activity_data1 = if temp >= 60
      ActivityService.get_activity('recreational')
    elsif temp >= 50 && temp < 60
      ActivityService.get_activity('busywork')
    else
      ActivityService.get_activity('cooking')
    end

    activity_data2 = ActivityService.get_activity('relaxation')
    [Activity.new(activity_data1), Activity.new(activity_data2)]
    end
  end
