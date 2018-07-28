class CreateLicenseHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :license_histories do |t|
      t.string     :name
      t.belongs_to :license_plate,index: true

      t.timestamps
    end
  end
end
