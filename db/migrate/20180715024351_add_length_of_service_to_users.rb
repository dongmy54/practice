class AddLengthOfServiceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :length_of_service, :integer
  end
end
