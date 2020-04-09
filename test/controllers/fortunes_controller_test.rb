require 'test_helper'

class FortunesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fortunes_index_url
    assert_response :success
  end

end
