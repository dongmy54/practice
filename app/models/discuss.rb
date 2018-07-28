# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  commenter    :string
#  body         :text
#  article_id   :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lock_version :integer
#  null_field   :string
#

class Discuss < ApplicationRecord
  self.table_name = 'comments'  # 指定一个存在的表名
end
