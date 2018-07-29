# == Schema Information
#
# Table name: products
#
#  id           :bigint(8)        not null, primary key
#  name         :string(10)
#  price        :decimal(10, 2)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_type :string
#

class Product < ApplicationRecord
  has_many :pictures, as: :imageable    # 多态 加别名
  belongs_to :user, touch: true

  validates_associated :user # 验证 product 时 会验证 user；它是有方向性的
  validates :name,:price, presence: {message: '%{attribute}不能为空'},strict: true # 严格验证，保存失败报错
                                                                                  # 还可以接 异常类
  validates :price, numericality: {greater_than_or_equal_to: 0, message: "值必须大于等于%{count}"}

  after_touch do
    puts '您 touch 了 product'
  end
  
end
