require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get books_delete_url
    assert_response :success
  end

end
