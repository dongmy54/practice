# == Schema Information
#
# Table name: users
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  address           :string
#  age               :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  home_page_urls    :string
#  terms_of_service  :boolean
#  email             :string
#  alisa_name        :string
#  role              :string
#  length_of_service :integer
#

class User < ApplicationRecord
  attr_accessor :email_confirmation
  has_many :products

  validates :name, presence: {message: '名字不能为空'}
  validates :name, length: {:in => 3..8,message: '名字只能是3-8位'}
  validates :alisa_name, length: {is: 4, message: '别名只能为四位'} # 长度只能为4位
  validates :terms_of_service, :acceptance => {message: '必须要接受才能保存哦'} # 当字段值不为nil是才验证

  validates :email,confirmation: {:message => '邮箱和确认邮箱需要匹配'}
  validates :email_confirmation,:presence => {message: '确认邮箱不能为空'}
  validates :email,format: {with: /\A[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+\z/,
                            message: '必须输入邮箱格式'}
  
  # 触发单个属性 验证器
  validates :email, email: true


  # 满足一个条件时 做多个验证
  # 这里也要加 if
  with_options if: :is_admin? do |admin| # 传对象
    admin.validates :home_page_urls,presence: {message: '管理员必须填%{attribute}字段'}
    admin.validates :age,numericality: {less_than: 30,message: '管理员年龄不能超过%{count}岁'}
  end
  # 验证 需多个条件
  validates :length_of_service,numericality: {:greater_than_or_equal_to => 5,
                                              :message => '工作年龄必须大于等于%{count}'},
                                              if: [:is_admin?,:age_than_30?],
                                              unless: Proc.new {|user| user.name.blank?}
  after_touch do 
    puts 'touch 了 user'
  end

  def is_admin?
    role == 'admin'
  end

  def age_than_30?
    age > 30
  end

end
