class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    # rails g model vehicle type:sting color:string price:decimal{10.2} 中间是小数点
    create_table :vehicles do |t|
      t.string :type
      t.string :color
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
