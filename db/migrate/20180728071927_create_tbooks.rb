class CreateTbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :tbooks do |t|
      t.string  :name
      t.integer :author_id

      t.timestamps
    end
    add_index :tbooks, :author_id
  end
end
