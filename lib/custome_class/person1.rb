# PS 在lib下 文件名可以和类名 不一样 
require 'active_model'     # 保证加载一次

class Person1
  # 转换
  include ActiveModel::Conversion

  def persisted?
    true
  end

  def id
    2
  end

end

# p = Person1.new
# p.to_model # => 返回p对象
# p.to_key   # nil (id非nil 返回id的数组)
# p.param    # nil (id非nil 且persisted? 返回true 返回id的字符串)