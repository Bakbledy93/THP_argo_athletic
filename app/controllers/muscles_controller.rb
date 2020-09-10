class MusclesController < ApplicationController

  def import
    Muscle.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
