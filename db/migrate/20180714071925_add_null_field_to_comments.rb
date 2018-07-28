class AddNullFieldToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :null_field, :string
  end
end
