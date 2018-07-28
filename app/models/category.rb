# == Schema Information
#
# Table name: categories
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class Category < ApplicationRecord
  # 不包含
  validates :name,:exclusion => {:in => ['dmy','dmc'], 
                                 :message => "%{value} 不能被包含其中哦"} # 这里插值用 %
  # 包含
  validates :name,:inclusion => {:in => %w(chengdu shanghai shenzheng beijing),
                                 :message => "类型只能是：chengdu shanghai shenzheng beijing 中的一个"},
                                 allow_nil: true # name 为 nil 则跳过验证
                                 # allow_blank 范围更广 nil / ''都会跳过验证
end
