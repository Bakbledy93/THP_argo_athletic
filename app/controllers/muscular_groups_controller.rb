class MuscularGroupsController < ApplicationController
  def import
    MuscularGroup.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
