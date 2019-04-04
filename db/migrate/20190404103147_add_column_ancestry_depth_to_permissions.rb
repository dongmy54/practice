class AddColumnAncestryDepthToPermissions < ActiveRecord::Migration[5.2]
  def change
    add_column :permissions, :ancestry_depth, :integer, default: 0
  end
end
