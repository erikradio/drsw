require 'test_helper'

class BiofileControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get biofile_search_url
    assert_response :success
  end

end
