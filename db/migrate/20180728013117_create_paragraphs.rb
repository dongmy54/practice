class CreateParagraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :paragraphs do |t|
      t.string  :name
      t.integer :section_id, index: true

      t.timestamps
    end
  end
end
