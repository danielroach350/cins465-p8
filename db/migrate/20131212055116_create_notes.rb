class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :comment
      t.text :notes
      t.integer :fish_id

      t.timestamps
    end
  end
end
