class IntensitiesController < ApplicationController

  def import
    Intensity.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
