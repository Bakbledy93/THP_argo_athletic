class RolesMuscularGroupCapacitiesController < ApplicationController
  def import
    RolesMuscularGroupCapacity.my_import(params[:file])
    redirect_to  import_admins_path
  end
end
