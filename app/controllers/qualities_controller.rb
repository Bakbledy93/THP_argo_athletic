class QualitiesController < ApplicationController
  
  def import
    Quality.my_import(params[:file])
    redirect_to  import_admins_path
  end

end