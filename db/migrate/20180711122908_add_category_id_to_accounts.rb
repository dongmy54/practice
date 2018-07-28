class AddCategoryIdToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :category_id, :integer
  end
end
