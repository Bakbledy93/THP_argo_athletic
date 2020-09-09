class MuscularGroupsController < ApplicationController
  def import
    MuscularGroup.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
