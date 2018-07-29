# == Schema Information
#
# Table name: model_suppliers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ModelSupplier < ApplicationRecord
  # 在不同作用域下的 model 不能正确关联
  # 除非完整指明类名
  has_one :model_account
end
