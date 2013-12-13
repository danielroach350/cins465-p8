class RemoveNotesFromNote < ActiveRecord::Migration
  def change
    remove_column :notes, :notes, :string
  end
end
