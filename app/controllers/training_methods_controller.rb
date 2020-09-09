class TrainingMethodsController < ApplicationController

  def import
    TrainingMethod.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
