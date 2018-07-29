# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  has_many :student_teacher_relations
  # 避免 N + 1 次查询
  # 加载teachers 时自动加载 shcool
  # 符号 + 关联方法名
  has_many :teachers, -> {includes :school},:through => :student_teacher_relations
end
