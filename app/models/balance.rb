# == Schema Information
#
# Table name: balances
#
#  id         :bigint(8)        not null, primary key
#  income     :decimal(10, 2)
#  expense    :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

class Balance < ApplicationRecord
  # 把验证交给其它类
  validates_with GoodnessValidator  # 这里什么也不用加

  after_destroy BalanceCallbacks  # 引用 回调类
  # PS： 如果那边定义的是 类方法 这里就用类，如果是实例方法 则这里用回调类的实例
end
