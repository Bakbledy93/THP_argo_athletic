class QualitiesController < ApplicationController
  
  def import
    Quality.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
