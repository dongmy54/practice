# PS 1、app/models中 如果文件名 和 常量不能匹配 是不能正常创建外层类/模块的
#    2、控制作用域,在不同module 下 不能建立关联

module Btest
  # == Schema Information
  #
  # Table name: model_suppliers
  #
  #  id         :bigint(8)        not null, primary key
  #  name       :string
  #  created_at :datetime         not null
  #  updated_at :datetime         not null
  #
  
  class ModelSupplier < ApplicationRecord
    # 在不同作用域下的 model 不能正确关联
    # 除非完整指明类名
    has_one :model_account
  end

  module C
    # == Schema Information
    #
    # Table name: model_accounts
    #
    #  id         :bigint(8)        not null, primary key
    #  number     :string
    #  created_at :datetime         not null
    #  updated_at :datetime         not null
    #
    class ModelAccount < ApplicationRecord
      belongs_to :model_supplier
    end
  end

end