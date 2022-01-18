class ActivitySerializer
  def self.format_json(destination, current, activities)
    {
      data: {
        id: nil,
        type: 'activities',
        attributes: {
          destination: destination,
          forecast: {
            summary: current.conditions,
            temperature: "#{current.temperature} F"
          },
          activities: activities.map  do |activity|
          {
            title: activity.title,
            type: activity.type,
            participants: activity.participants,
            price: activity.price
          }
        end
        }
      }
    }
  end
end
