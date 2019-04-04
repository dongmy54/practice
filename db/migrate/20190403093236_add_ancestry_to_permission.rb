class AddAncestryToPermission < ActiveRecord::Migration[5.2]
  def change
    add_column :permissions, :ancestry, :string
    add_index :permissions, :ancestry
  end
end
