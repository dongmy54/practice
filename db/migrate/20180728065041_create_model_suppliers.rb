class CreateModelSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :model_suppliers do |t|
      t.string :name

      t.timestamps
    end
  end
end
