# == Schema Information
#
# Table name: books
#
#  id           :bigint(8)        not null, primary key
#  published_at :datetime
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  active       :boolean          default(TRUE)
#

class Book < ApplicationRecord
  # inverse_of 接本 model 在模型中充当 单/复数
  belongs_to :author,:inverse_of => :books

  after_destroy do 
    puts '书被删除了'
  end
  
end
