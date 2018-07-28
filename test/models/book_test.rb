# == Schema Information
#
# Table name: books
#
#  id           :bigint(8)        not null, primary key
#  published_at :datetime
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
