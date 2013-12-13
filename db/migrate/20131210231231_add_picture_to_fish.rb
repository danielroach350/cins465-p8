class AddPictureToFish < ActiveRecord::Migration
  def change
    add_column :fish, :fish_photo, :string
  end
end
