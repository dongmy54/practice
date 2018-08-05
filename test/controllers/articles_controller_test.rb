# == Schema Information
#
# Table name: articles
#
#  id             :bigint(8)        not null, primary key
#  title          :string
#  text           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author         :string
#  comments_count :integer          default(0), not null
#  category_id    :integer
#

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "sd" do
  end
end
