# == Schema Information
#
# Table name: books
#
#  id           :bigint(8)        not null, primary key
#  published_at :datetime
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  active       :boolean          default(TRUE)
#  cover        :string
#

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get books_delete_url
    assert_response :success
  end

end
