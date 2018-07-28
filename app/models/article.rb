# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author     :string
#

class Article < ApplicationRecord
  has_many :comments, :dependent => :destroy

  validates :title, presence: true, length: {minimum: 6}
  # scope同时验证 title和 text 两个字段的唯一性
  # uniqueness 不能保证 数据库中的唯一性，它只是model 层面的 
  validates :title, uniqueness: {scope: :text,
                                 message: '文章标题应该是唯一的'}

  after_initialize do
    puts "恭喜您！初始化了一篇文章"
  end # 在取出数据时 也会起作用

  after_find :after_find_say # 

  private

    def after_find_say
      puts '你找到这一表数据了'
    end

end
