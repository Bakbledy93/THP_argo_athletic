class CapacitiesController < ApplicationController

  def import
    Capacity.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
