class RoadTripFacade
  def self.road_trip_info(start,finish)
    route_data = MapQuestService.get_route(start,finish)

    direction_data = MapQuestService.get_geocode(finish)
    time = route_data[:route][:formattedTime]
    weather = ForecastService.get_forecast(direction_data[:results][0][:locations][0][:latLng][:lat], direction_data[:results][0][:locations][0][:latLng][:lng], 48)
    time_at_eta = time.to_i.round -1
    temp_at_eta = weather[:hourly][time_at_eta][:temp]
    conditions_at_eta = weather[:hourly][time_at_eta][:weather][0][:description]
    data = {
      start_city: start,
      end_city: finish,
      travel_time: time,
      weather_at_eta: {
        temperature: temp_at_eta,
        conditions: conditions_at_eta
      }
    }
    RoadTrip.new(data)
  end
end
