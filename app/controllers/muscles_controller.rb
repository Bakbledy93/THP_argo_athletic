class MusclesController < ApplicationController

  def import
    Muscle.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
