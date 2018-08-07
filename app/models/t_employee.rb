# == Schema Information
#
# Table name: t_employees
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  manage_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# 自联结
class TEmployee < ApplicationRecord
  # 本质：利用class_name foregin_key
  # 表中加一个关联字段就行
  # 另外 has_many belongs_to 这里的名字 也是自己定的
  has_many   :subordinates, :class_name => 'TEmployee',:foreign_key => "manage_id"
  belongs_to :manage,       :class_name => 'TEmployee'
  # 只要外键能通过 has_many/belongs_to 后接的方法推导 出来就不用 写 foreign_key
end
