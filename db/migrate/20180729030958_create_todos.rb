class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :user_id
      t.string :title

      t.timestamps
    end

    add_index :todos, :user_id
  end
end
