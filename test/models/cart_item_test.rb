# == Schema Information
#
# Table name: cart_items
#
#  id          :bigint(8)        not null, primary key
#  tproduct_id :integer
#  cart_id     :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
