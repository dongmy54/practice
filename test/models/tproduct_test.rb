# == Schema Information
#
# Table name: tproducts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TproductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
