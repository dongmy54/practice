# == Schema Information
#
# Table name: t_employees
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  manage_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TEmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
