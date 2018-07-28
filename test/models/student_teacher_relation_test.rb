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

require 'test_helper'

class StudentTeacherRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
