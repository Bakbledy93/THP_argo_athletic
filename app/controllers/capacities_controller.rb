class CapacitiesController < ApplicationController

  def import
    Capacity.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
