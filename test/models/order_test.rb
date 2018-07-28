# == Schema Information
#
# Table name: orders
#
#  id           :bigint(8)        not null, primary key
#  payment_type :string
#  card_number  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
