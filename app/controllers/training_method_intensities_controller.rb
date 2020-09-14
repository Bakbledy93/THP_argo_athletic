class TrainingMethodIntensitiesController < ApplicationController

  def import
    TrainingMethodIntensity.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
