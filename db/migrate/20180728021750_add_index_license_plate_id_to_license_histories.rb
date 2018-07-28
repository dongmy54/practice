class AddIndexLicensePlateIdToLicenseHistories < ActiveRecord::Migration[5.1]
  def change
    # 动作 表名 字段 其它选项
    remove_index :license_histories,:license_plate_id
    say '先去掉之前索引'
    add_index  :license_histories,:license_plate_id, unique: true
    say '为license_histories 添加唯一索引成功'
  end
end
