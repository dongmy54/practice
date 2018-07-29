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

class Comment < ApplicationRecord
  belongs_to :article, :counter_cache => true # 计数缓存开启 让articles存comment数量
                                              # 并且数量由rails 自己维护
  # absence 与 presence 对应哦
  validates :null_field,absence: true # 这个字段只能为nil / ''

  # 自定义验证 validate 为单数
  # 可接 块/符号
  # on 也可以用
  validate :day_not_weekday,on: :update
  validate Proc.new {|c| c.errors.add(:body,'body 不能为空') if c.body.blank?}
  before_create :create_comment_say, if: lambda {|c| c.commenter == 'dmy'}

  # 由于关联性回调的存在 在删除articel 时 触发这里的删除回调
  after_destroy do
    puts '评论已被删除'
  end

  def day_not_weekday
    # 不是针对某一个字段的 用base
    errors.add(:base,'周末不能更新添加评论') if [6,0].include?(Time.now.wday) 
  end

  private
    # 会调方法 放入 私有
    def create_comment_say
      puts '大神来评论了'
    end

end
