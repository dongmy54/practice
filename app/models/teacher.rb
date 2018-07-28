# == Schema Information
#
# Table name: teachers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ApplicationRecord
  has_many :student_teacher_relations
  has_many :students, :through => :student_teacher_relations
end
