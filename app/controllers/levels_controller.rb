class LevelsController < ApplicationController

  def import
    Level.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
