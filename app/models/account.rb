# == Schema Information
#
# Table name: accounts
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  age         :integer
#  address     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  surname     :string
#  uuid        :string
#

class Account < ApplicationRecord
  scope :age_old, -> {where('age > ?', 30)}                          # 等同于定义类方法
  scope :age_greater_than, ->(age){ where('age > ?', age)}           # 也可传参数
  scope :name_include_dm, -> {where('name ~ ?','.*dm.*')}
  scope :big_id_and_age, -> {age_old.where('id > :id',:id => 10)}    # 后面作用域 可以用前面的

  # 在验证中 message 内容 装在单引号中也是可以的
  # model 模型名
  validates :name,presence: {message: '%{model}哦'},on: :update # 这里状态 create update 用符号
  validates :age, presence: true
  validates :surname,uniqueness: { # message 接块 可以定制更复杂的消息
                                 message: ->(object,data) do
                                  # data 是一个hash
                                  # data {:model=>"Account", :attribute=>"Surname", :value=>"sdaf"}
                                  "hello #{object.name}, #{data[:value]} 已经被占用了#{Time.now.tomorrow}"
                                 end
                               }
  # {} 里面拼写错误 居然不报错 醉了
  validates :age, numericality: {greater_than: 18},on: :adult_v # 自己命名一个验证条件
  # 在 a.valid?(:adult_v) / a.save(context: :adult_v) 必须按传上下文 才会去验证

  # 回调
  # 接块时多半 会传参数
  # before_validation do |account| 
  #   account.address = 'sichuan' if account.address.blank?
  # end

  # 可用self 代替不传参数
  before_validation do 
    self.address = 'sichuan' if self.address.blank?
    #throw :abort   # 这会终止回调
  end

  Account.find(111).update_columns(:age => 18) # 加载这个model 就会执行

  after_destroy do
    Account.find(111).update_columns(:age => 18)
    puts '同时更新了age'
  end

  before_create :add_uuid_to_account

  # Account.transaction do
  #   Account.find[110].destroy
  #   raise Excepection.new('dsa')
  # end




  private
    # h回调方法定义成私有
    def add_uuid_to_account
      self.uuid = SecureRandom.uuid
    end
end
