class AddAlisaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :alisa_name, :string
  end
end
