class AddSurnameToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :surname, :string
  end
end
