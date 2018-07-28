class CreateTEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :t_employees do |t|
      t.string :name
      t.integer :manage_id, index: true

      t.timestamps
    end
  end
end
