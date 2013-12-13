json.array!(@weathers) do |weather|
  json.extract! weather, :id, :weather_info, :fish_id, :currentTime, :moonPercentage, :location, :zipCode, :elevation, :observationLocation, :observationLocationElevation, :observationTime, :currentWeather, :temperature, :relative_humidity, :windInformation, :precipToday
  json.url weather_url(weather, format: :json)
end
