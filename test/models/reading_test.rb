# == Schema Information
#
# Table name: readings
#
#  id         :bigint(8)        not null, primary key
#  article_id :integer
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
