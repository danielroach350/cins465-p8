class RemoveFirstFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :last, :string
  end
end
