json.array!(@fish) do |fish|
  json.extract! fish, :id, :fish_type, :fish_length, :fish_weight, :caught_on, :longitude, :latitude
  json.url fish_url(fish, format: :json)
end
