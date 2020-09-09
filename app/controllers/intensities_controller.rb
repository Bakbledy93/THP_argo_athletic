class IntensitiesController < ApplicationController

  def import
    Intensity.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
