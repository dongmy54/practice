class AddForeignKeyAccounts < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :accounts,:categories
  end
end
