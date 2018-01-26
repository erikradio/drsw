require 'test_helper'

class MasterfileControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get masterfile_search_url
    assert_response :success
  end

end
