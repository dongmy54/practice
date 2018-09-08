# == Schema Information
#
# Table name: todos
#
#  id         :bigint(8)        not null, primary key
#  user_id    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
