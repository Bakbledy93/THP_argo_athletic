require 'test_helper'

class SportsControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get sports_import_url
    assert_response :success
  end

end
