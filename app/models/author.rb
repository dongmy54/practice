# == Schema Information
#
# Table name: authors
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord
  has_many :books,:dependent => :nullify # 在拥有许多 这里建立关联删除
                                         # destroy 执行回调
                                         # delete_all 不执行回调
                                         # nullify 把关联外键设为nil
                                         # restrict_with_exception 炮异常
                                         # restrict_with_error 返回false 

  # Author.create(:name => 'saf')
  # Author.last.books.create(:published_at => Time.now)
  # Author.last.destroy
end
