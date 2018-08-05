# == Schema Information
#
# Table name: schools
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ApplicationRecord
  # 回调
  extend ActiveModel::Callbacks

  define_model_callbacks :update
  before_update :reset_me

  has_many :teachers


  # School.last.update 覆盖了默认的 update 方法
  def update
    run_callbacks(:updat) do
      puts '正在执行更新操作'
    end
  end

  def reset_me
    puts '重置更新学校'
  end

end
