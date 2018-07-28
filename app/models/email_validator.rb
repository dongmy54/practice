# 验证单个属性的类

class EmailValidator < ActiveModel::EachValidator  # 继承自 EachValidator
  
  # 里面必须定义 validate_each
  def validate_each(record,attr,value)

    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attr] << '%{value}不是一个邮箱'
    end

  end

end