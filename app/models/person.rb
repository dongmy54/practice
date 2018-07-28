# == Schema Information
#
# Table name: people
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  surname    :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  # 将字段 一个个拿进去验证
  # 这种方式的验证 生成的错误信息 和 一般的验证一样
  validates_each :name,:surname do |record,attr,value|
    record.errors.add(attr,'名字和姓都必须以大写开头') if value =~ /\A[[:lower:]]/
  end

  # 回调流程
  before_validation do
    puts '执行before_validation'
  end

  after_validation do
    puts 'exec after_validation'
  end

  before_save do
    puts 'exec before_save'
  end

  # around_save 会干扰 create 创建过程 导致 数据回滚
  # around_save do
  #   puts 'exec around_save'
  # end

  before_create do
    puts 'exec before_create'
  end

  around_create do
    puts 'exec around_create'
  end

  after_create do
    puts 'exec after_create'
  end

  after_save do
    puts 'exec after_save'
  end

  # 在这种情况下 after_commit 不被执行 
  # 猜测回调与 回调之间有影响（注释调前面的回调 就可执行）
  after_commit do
    puts 'exec after_commit'
  end



end
