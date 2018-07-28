# == Schema Information
#
# Table name: products
#
#  id           :bigint(8)        not null, primary key
#  name         :string(10)
#  price        :decimal(10, 2)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_type :string
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
