class AddCaughtDateToFish < ActiveRecord::Migration
  def change
    add_column :fish, :caught_date, :datetime
  end
end
