class CreateTproducts < ActiveRecord::Migration[5.1]
  def change
    create_table :tproducts do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
