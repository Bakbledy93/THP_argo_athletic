require 'test_helper'

class WorkoutprogramsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get workoutprograms_show_url
    assert_response :success
  end

  test "should get new" do
    get workoutprograms_new_url
    assert_response :success
  end

  test "should get edit" do
    get workoutprograms_edit_url
    assert_response :success
  end

  test "should get update" do
    get workoutprograms_update_url
    assert_response :success
  end

end
