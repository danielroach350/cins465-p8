class AddNoteToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :note, :text
  end
end
