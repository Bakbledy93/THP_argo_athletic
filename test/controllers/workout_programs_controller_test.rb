require 'test_helper'

class WorkoutProgramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workout_programs_index_url
    assert_response :success
  end

  test "should get show" do
    get workout_programs_show_url
    assert_response :success
  end

  test "should get new" do
    get workout_programs_new_url
    assert_response :success
  end

  test "should get create" do
    get workout_programs_create_url
    assert_response :success
  end

end
