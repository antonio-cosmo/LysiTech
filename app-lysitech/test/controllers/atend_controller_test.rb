require "test_helper"

class AtendControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atend_index_url
    assert_response :success
  end
end
