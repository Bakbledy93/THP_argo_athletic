class TrainingMethodLevelsController < ApplicationController

  def import
    TrainingMethodLevel.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
