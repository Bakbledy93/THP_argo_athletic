class AdminsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def import
    @sport = Sport.all
    @sportrole = SportRole.all
    @quality = Quality.all
  end

end
