# == Schema Information
#
# Table name: accounts
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  age         :integer
#  address     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  surname     :string
#  uuid        :string
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
