class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :comment_id

      t.timestamps
    end
  end
end
