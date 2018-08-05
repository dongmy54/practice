class Person7
  # 安全密码
  include ActiveModel::SecurePassword
  has_secure_password
  attr_accessor :password_digest   # 默认的密码摘要字段

end

# p = Person7.new
# p.valid? 
# 
# p.password = '123'
# p.valid?
# 
# # 密码长度不能超过 72
# p.password = p.password_confirmation = 'd' * 73
# p.valid?
# 
# p.password = '123'
# p.password_confirmation = '1234'
# p.valid?
# 
# p.password_confirmation = '123'
# p.valid?
