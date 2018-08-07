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
  belongs_to :user,primary_key: 'guid' # 由于uer中启用了外键 所以todos字段中 user_id 存的是 guid(users表)
  # 这里也要添加主键 不然 它还是用id 去找
  after_update do
    puts '更新后回调'
  end

end
