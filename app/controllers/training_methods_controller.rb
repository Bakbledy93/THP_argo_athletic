class TrainingMethodsController < ApplicationController

  def import
    TrainingMethod.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
