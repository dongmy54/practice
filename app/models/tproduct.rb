# == Schema Information
#
# Table name: tproducts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tproduct < ApplicationRecord
  # 由于tproduct 可以不用 cart_items 这里可以不用写出
  #has_many :cart_items
end
