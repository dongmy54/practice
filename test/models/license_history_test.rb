# == Schema Information
#
# Table name: license_histories
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  license_plate_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class LicenseHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
