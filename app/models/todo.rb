# == Schema Information
#
# Table name: todos
#
#  id         :bigint(8)        not null, primary key
#  user_id    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todo < ApplicationRecord
  validate ->{ puts '执行了验证' }
  belongs_to :user # 由于uer中启用了外键 所以todos字段中 user_id 存的是 guid(users表)

end
