class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :weather_info
      t.integer :fish_id
      t.string :currentTime
      t.float :moonPercentage
      t.string :location
      t.string :zipCode
      t.float :elevation
      t.string :observationLocation
      t.string :observationLocationElevation
      t.string :observationTime
      t.string :currentWeather
      t.string :temperature
      t.string :relative_humidity
      t.string :windInformation
      t.string :precipToday

      t.timestamps
    end
  end
end
