require 'test_helper'

class RolesMuscularGroupCapacitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get roles_muscular_group_capacities_import_url
    assert_response :success
  end

end
