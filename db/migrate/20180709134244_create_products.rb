class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, limit: 10
      t.decimal :price, precision: 10, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
