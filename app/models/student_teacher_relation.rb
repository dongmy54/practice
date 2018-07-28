# == Schema Information
#
# Table name: student_teacher_relations
#
#  id         :bigint(8)        not null, primary key
#  student_id :integer
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentTeacherRelation < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
end
