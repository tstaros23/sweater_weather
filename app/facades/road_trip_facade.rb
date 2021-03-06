class RoadTripFacade
  def self.road_trip_info(start,finish)
    route_data = MapQuestService.get_route(start,finish)

    direction_data = MapQuestService.get_geocode(finish)
    if route_data[:route][:formattedTime].nil?
      time = "impossible route"
    else
      time = route_data[:route][:formattedTime]
    end
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
    if data[:travel_time] == "impossible route"
      data[:weather_at_eta].clear
    else
      data
    end
    RoadTrip.new(data)
  end
end
