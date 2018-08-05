class Person3
  # 验证
  include ActiveModel::Validations

  attr_accessor :name, :email, :token

  validates :name, presence: true
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
  validates! :token, presence: true   # 严格验证 不通过抛异常

end


# p = Person3.new
# p.token = 'sadf' 
# p.valid?    # false
# p.name = 'dmy'
# p.valid?    # false
# p.email = 'test@qq.com'
# p.valid?    # true