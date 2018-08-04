class AddLockOrderVersionToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :lock_order_version, :integer
  end
end
