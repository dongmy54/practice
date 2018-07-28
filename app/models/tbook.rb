# == Schema Information
#
# Table name: tbooks
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tbook < ApplicationRecord
  # 不按常规来 它就不能推导出类名、外键 所以需要指定
  belongs_to :writer,:class_name => 'Tauthor', :foreign_key => 'author_id' 
end
