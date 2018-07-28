# == Schema Information
#
# Table name: books
#
#  id           :bigint(8)        not null, primary key
#  published_at :datetime
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ApplicationRecord
  belongs_to :author

  after_destroy do 
    puts '书被删除了'
  end
  
end
