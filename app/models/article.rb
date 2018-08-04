# == Schema Information
#
# Table name: articles
#
#  id             :bigint(8)        not null, primary key
#  title          :string
#  text           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author         :string
#  comments_count :integer          default(0), not null
#  category_id    :integer
#

class Article < ApplicationRecord
  belongs_to :category
  has_many :tags
  # 关联作用域只能紧挨着 关联
  # 可接 字符串/hash
  has_many :comments, -> {where "comments.id > 4"}, :dependent => :destroy do
    # Article.first.comments.extend_a_method 调用 
    def extend_a_method
      puts '这是一个关联扩展方法'
    end

  end

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
