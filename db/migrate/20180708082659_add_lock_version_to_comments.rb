class AddLockVersionToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :lock_version, :integer
  end
end
