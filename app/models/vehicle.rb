# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint(8)        not null, primary key
#  type       :string
#  color      :string
#  price      :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# 单表继承
# 其中 type 存 Car/Motorcycle
class Vehicle < ApplicationRecord
end
