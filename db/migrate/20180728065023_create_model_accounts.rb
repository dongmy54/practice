class CreateModelAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :model_accounts do |t|
      t.string  :number
      t.integer :model_supplier_id, index: true, foregin_key: true # 指明外键 保证引用完整

      t.timestamps
    end
  end
end
