# == Schema Information
#
# Table name: orders
#
#  id                 :bigint(8)        not null, primary key
#  payment_type       :string
#  card_number        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lock_order_version :integer
#  status             :integer          default("place_on_order")
#

class Order < ApplicationRecord
  # 0 下单 1 发货
  enum status: [:place_on_order,:shipment]       # 宏
  # o.status 将数字 映射为这里的 名称
  # o.place_on_order? 返回 true/false
  # o.place_on_order! 切换成 此状态

  self.locking_column = :lock_order_version      # 自定义乐观锁列名

  validates :card_number,presence: true, if: :payment_type_is_card? # 支付类型 为 card 才验证

  validates :payment_type,inclusion: {in: %w(card cash weixin zhifubao),
                                      message: "支付类型只能是 支付宝/微信/银行卡/现金"}, 
                                      unless: lambda {|order| order.payment_type.blank? }
                                        # 也可接块 块中传 对象进去 适合判断较少的情况

  def payment_type_is_card?
    payment_type == 'card'
  end

end
