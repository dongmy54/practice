# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Cart < ApplicationRecord
  has_many :cart_items
  has_many :tproducts,:through => :cart_items # source: :tproduct  源写model名（非表名）
end
