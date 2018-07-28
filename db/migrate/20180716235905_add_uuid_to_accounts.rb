class AddUuidToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :uuid, :string
  end
end
