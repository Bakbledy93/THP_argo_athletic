class ExtypesController < ApplicationController

  def import
    Extype.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
