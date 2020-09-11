class TrainingMethodExercisesController < ApplicationController
  def import
    TrainingMethodExercise.my_import(params[:file])
    redirect_to  import_admins_path
  end
end
