class SportRolesController < ApplicationController
  def import
    SportRole.my_import(params[:file])
    redirect_to  import_admins_path
  end
end
