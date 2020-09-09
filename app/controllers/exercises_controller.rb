class ExercisesController < ApplicationController

  def import
    Exercise.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
