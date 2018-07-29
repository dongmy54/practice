# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint(8)        not null, primary key
#  type       :string
#  color      :string
#  price      :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
