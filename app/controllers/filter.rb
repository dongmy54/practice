# 复用的过滤器
class Filter

  #  参数为 controller
  def self.before(controller)
    puts '---------进'
    if controller.send(:name_is_dmy?)  # 由于 name_is_dmy?是 私有方法 用send
      controller.send(:set_dmy_cookie)
    end
  end

end