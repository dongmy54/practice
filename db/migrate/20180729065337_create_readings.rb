class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.integer :article_id
      t.integer :person_id

      t.timestamps
    end

    add_index :readings,[:article_id,:person_id]
  end
end
