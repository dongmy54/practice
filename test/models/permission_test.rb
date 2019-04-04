# == Schema Information
#
# Table name: permissions
#
#  id             :bigint(8)        not null, primary key
#  action         :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ancestry       :string
#  ancestry_depth :integer          default(0)
#

require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
