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
  has_one :license_plate # 单数
  has_one :license_history,:through => :license_plate
end
