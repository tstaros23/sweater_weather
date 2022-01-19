class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta, :id

  def initialize(attr)
    @start_city = attr[:start_city]
    @end_city = attr[:end_city]
    @travel_time = is_possible?(attr)
    @weather_at_eta = attr[:weather_at_eta]
  end

  def is_possible?(attr)
    if attr.has_key?(:distance)
      attr[:travel_time]
    else
      "impossible route"
    end
  end
end
