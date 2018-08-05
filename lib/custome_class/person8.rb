class Person8
  # 回调
  extend ActiveModel::Callbacks
  define_model_callbacks :update

  before_update :reset_me     # 这里的回调 和上面注册的回调类型有关

  def update
    run_callbacks(:update) do
      puts '在对象上执行update方法'
    end
  end

  def reset_me
    puts '我是前置回调，在update方法执行前执行'
  end

end

# p = Person8.new
# p.update
# 我是前置回调，在update方法执行前执行
# 在对象上执行update方法