# == Schema Information
#
# Table name: balances
#
#  id         :bigint(8)        not null, primary key
#  income     :decimal(10, 2)
#  expense    :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

require 'test_helper'

class BalanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
