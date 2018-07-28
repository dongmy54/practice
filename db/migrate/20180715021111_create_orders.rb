class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :payment_type
      t.string :card_number

      t.timestamps
    end
  end
end
