class GoodnessValidator < ActiveModel::Validator
  # 这是一个专门用来做验证的类 不是model 哈

  def validate(record)
    if record.income < 0 # record 可以简单理解为 我们要创建model的对象
      record.errors[:base] << '收入也太少了吧'  # record.errors[:base]是一种对于整个对象的验证
    end
    if record.expense > 1000
      record.errors[:base] << '消费太高，你需要节俭点'
    end
  end

end