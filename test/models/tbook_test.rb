# == Schema Information
#
# Table name: tbooks
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TbookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
