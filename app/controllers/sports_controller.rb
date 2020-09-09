class SportsController < ApplicationController
  def import
    Sport.my_import(params[:file])
    redirect_to  import_home_path
  end
end
