# == Schema Information
#
# Table name: model_accounts
#
#  id                :bigint(8)        not null, primary key
#  number            :string
#  model_supplier_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ModelAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
