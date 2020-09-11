class ExercisesController < ApplicationController

  def import
    Exercise.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
