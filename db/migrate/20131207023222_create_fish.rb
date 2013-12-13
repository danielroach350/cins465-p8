class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :fish_type
      t.float :fish_length
      t.float :fish_weight
      t.string :caught_on
      t.float :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
