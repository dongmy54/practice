class CreateCatrgories < ActiveRecord::Migration[5.1]
  def change
    create_table :catrgories do |t|
      t.string :name

      t.timestamps
    end
  end
end
