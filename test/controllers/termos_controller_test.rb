require 'test_helper'

class TermosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get termos_index_url
    assert_response :success
  end

end
