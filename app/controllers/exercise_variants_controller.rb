class ExerciseVariantsController < ApplicationController

  def import
    ExerciseVariant.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
