class Mobile
  #  属性方法
  include ActiveModel::AttributeMethods
  attr_accessor :number

  
  attribute_method_prefix  'dmy_'
  attribute_method_suffix   '_dmy'
  define_attribute_methods 'number'     # 接字符串 定义属性方法要放最后


  private
    def dmy_attribute(attribute)
      send("#{attribute}=",'456789')  # 等号放在外面
    end

    def attribute_dmy(attribute)
      send(attribute).length > 3
    end

end

# m = Mobile.new
# m.dmy_number         # 不用传参数
# m.number_dmy