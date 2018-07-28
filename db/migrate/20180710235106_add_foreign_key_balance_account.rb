class AddForeignKeyBalanceAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :balances, :account_id, :integer # 需先创建
    add_foreign_key :balances,:accounts # 类似于 add_index 直接写在迁移中
  end
end
