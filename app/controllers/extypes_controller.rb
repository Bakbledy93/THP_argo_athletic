class ExtypesController < ApplicationController

  def import
    Extype.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
