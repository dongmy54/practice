class CreateLicensePlates < ActiveRecord::Migration[5.1]
  def change
    create_table :license_plates do |t|
      t.string  :license_number
      # 唯一索引 代表supplier_id 只能被一个 LicensePlate使用 也就是单列不能重复
      t.integer :supplier_id, index: {unique: true}, foreign_key: true

      t.timestamps
    end
  end
end
