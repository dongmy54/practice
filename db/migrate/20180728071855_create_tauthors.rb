class CreateTauthors < ActiveRecord::Migration[5.1]
  def change
    create_table :tauthors do |t|
      t.string :name

      t.timestamps
    end
  end
end
