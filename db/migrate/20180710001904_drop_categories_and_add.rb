class DropCategoriesAndAdd < ActiveRecord::Migration[5.1]
  def change
    drop_table :catrgories

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
