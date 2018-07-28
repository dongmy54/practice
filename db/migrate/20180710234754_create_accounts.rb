class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :age
      t.string :address

      t.timestamps
    end
  end
end
