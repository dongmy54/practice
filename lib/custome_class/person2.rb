class Person2
  # 弄脏
  include ActiveModel::Dirty
  define_attribute_methods :first_name,:last_name

  def first_name
    @first_name
  end

  def first_name=(value)
    first_name_will_change! # 
    @first_name = value
  end

  def last_name
    @last_name
  end

  def last_name=(value)
    last_name_will_change!
    @last_name = value
  end

  def save
    # 执行保存操作
    changes_applied
  end

end

# p = Person2.new
# p.changed?      # => false 是否改变
# p.first_name = 'firt name'
# p.changed?      # => true  已经改变
# p.changed       # => ['first_name']   改变字段
# p.changed_attributes # => {'first_name' => nil}  改变字段以前值
# p.changes       # => {'first_name' => [nil, 'first name']}  改变前后值
# 
# p.first_name_changed?  # true 某个属性是否改变
# p.first_name_change    # 某个属性改变前后 值 这里单数






