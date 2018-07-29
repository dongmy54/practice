# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# 供应商
class Supplier < ApplicationRecord
  has_one :license_plate # 单数 发现在保存此对象时 其关联的对象也会同时验证 不用写 validate: true
  has_one :license_history,:through => :license_plate
end
