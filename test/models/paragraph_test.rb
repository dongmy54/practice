# == Schema Information
#
# Table name: paragraphs
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  section_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ParagraphTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
