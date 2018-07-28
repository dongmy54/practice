# == Schema Information
#
# Table name: cart_items
#
#  id          :bigint(8)        not null, primary key
#  tproduct_id :integer
#  cart_id     :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CartItem < ApplicationRecord
  # 中间人 必须写全 双向关联
  belongs_to :cart
  belongs_to :tproduct
end
