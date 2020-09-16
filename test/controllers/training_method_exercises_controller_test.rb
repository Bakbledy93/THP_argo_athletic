require 'test_helper'

class TrainingMethodExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get training_method_exercises_import_url
    assert_response :notice
  end

end
