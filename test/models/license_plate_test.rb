# == Schema Information
#
# Table name: license_plates
#
#  id             :bigint(8)        not null, primary key
#  license_number :string
#  supplier_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class LicensePlateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
