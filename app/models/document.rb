# == Schema Information
#
# Table name: documents
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null

# 当扩展包含多个方法时 写入模块中
# 另外发现 关联方法扩展 和 关联作用域不能同时使用（不兼容）
module DocumentSection
  def extend_method
    puts '关联扩展方法'
    puts "#{proxy_association.owner} 关联自身对象"
    puts "#{proxy_association.reflection} 反射关系"
    puts "#{proxy_association.target}"
  end
end

class Document < ApplicationRecord
  has_many :sections, -> {extending DocumentSection}
  has_many :paragraphs, :through => :sections
end
