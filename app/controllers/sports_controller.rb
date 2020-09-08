class SportsController < ApplicationController
  def import
    Sport.my_import(params[:file])
  end
end
