# class Person5
#   #  序列化
#   include ActiveModel::Serialization

#   attr_accessor :name,:email

#   def attributes
#     # 回自动将 name 和 email 值填进去
#     {'name' => nil, 'email' => nil}
#   end

# end

# p = Person5.new
# p.name = 'dmy'
# p.serializable_hash        # => {'name' => 'dmy', 'email' => nil}
# p.email = '123@qq.com'
# p.serializable_hash        # => {'name' => 'dmy', 'email' => '123@qq.com'}


class Person5
  # 序列化 + 反序列化
  # 这里是 Serializers
  include ActiveModel::Serializers::JSON     # 会自动加载 ActiveModel::Serialization

  attr_accessor :name, :email

  def attributes=(hash)
    hash.each do |key,value|
      send("#{key}=", value)
    end
  end

  def attributes
    {'name' => nil, 'email' => nil}
  end

end

# p = Person5.new
# h = {:name => 'dmy1', 'email' => '456@qq.com'}.to_json
# p.from_json(h)    # 将json导入
# # => #<Person5:0x007fb0df3fa9c0 @name="dmy1", @email="456@qq.com">  
# p.name               # "dmy1"
# p.as_json            # {'name' => 'dmy1', 'email' => '456@qq.com'} 序列化出来



