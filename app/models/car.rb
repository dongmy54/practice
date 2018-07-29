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

# rails g model car --parent=Vehicle
# 单表继承
class Car < Vehicle
end
