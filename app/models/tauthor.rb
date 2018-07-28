# == Schema Information
#
# Table name: tauthors
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tauthor < ApplicationRecord
  # model只会按照 你给它的名字去推导外键 这里 外键不是tauthor_id（标准）
  # 经过测试 现在已经能够双向关联了
  # 而不用添加 inverse_of: 'writer'
  has_many :tbooks,foreign_key: 'author_id'
end
