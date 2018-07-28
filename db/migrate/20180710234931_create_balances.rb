class CreateBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :balances do |t|
      t.decimal :income, precision: 10, scale: 2
      t.decimal :expense, precision: 10, scale: 2

      t.timestamps
    end
  end
end
