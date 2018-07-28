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

class TEmployee < ApplicationRecord
  # 本质：利用class_name foregin_key
  # 表中加一个关联字段就行
  # 另外 has_many belongs_to 这里的名字 也是自己定的
  has_many   :subordinates, :class_name => 'TEmployee',:foreign_key => "manage_id"
  belongs_to :manager,      :class_name => 'TEmployee', required: false # require 允许 manage_id 为空
end
