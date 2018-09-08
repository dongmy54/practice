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
#  guid              :string
#  password_digest   :string
#  avatar            :string
#

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  # 自动获得 password password_confirmation 两个虚拟字段
  # 当password_confirmation 为nil,不验证 password 和 password_confirmation 的一致性
  # u.update_attribute(:password,'12346') 即可以更新密码
  # u.authenticate('123456') 即可以 认证密码 通过返回user 对象

  # 默认作用域 在创建记录时 如果设定字段值 也会影响刚创建的
  # unscoped 去掉 默认作用域
  default_scope {order(:age => :desc)}    # 默认作用域 也可定义为类方法
  scope :search_role, ->(role){where('role = ?',role) if role.present?}

  attr_accessor :email_confirmation
  has_many :products

  validates :name, presence: {message: '名字不能为空'}
  validates :name, length: {:in => 3..8,message: '名字只能是3-8位'}
  validates :alisa_name, length: {is: 4, message: '别名只能为四位'} # 长度只能为4位
  validates :terms_of_service, :acceptance => {message: '必须要接受才能保存哦'} # 当字段值不为nil是才验证

  validates :email,confirmation: {:message => '邮箱和确认邮箱需要匹配'}
  validates :email_confirmation,:presence => {message: '确认邮箱不能为空'}, on: :create
  validates :email,format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
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
  # 外键 在 不是id的情况指定
  has_many :todos,:primary_key => 'guid',validate: false # 妈的关掉 也执行验证

  after_touch do 
    puts 'touch 了 user'
  end

  def is_admin?
    role == 'admin'
  end

  def age_than_30?
    age > 30
  end

  # 模型重载 和字段同名
  # 这个方法 在name 存取时 会自动将 I am 一起存到数据库
  # def name
  #   "I am #{super}"
  # end

  # def self.search_role(role)       
  #   if role.present?           # 与作用域不同的是 类方法：当条件不满足时回传nil;而作用域不管什么情况都回传ActiveRecord::Relation
  #     where('role = ?', role)
  #   end
  # end

end

# User.create!(name: 'dmyd',:address => '北京五环',age: 18,home_page_urls: 'https://example.com',terms_of_service: true,email: '456@qq.com',email_confirmation: '456@qq.com',alisa_name: 'suqj',:password => '123456')
