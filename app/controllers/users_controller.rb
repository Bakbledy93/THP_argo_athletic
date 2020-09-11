class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :edit]

  def authenticate_user
    unless current_user
      flash[:danger] = "Unauthorized page"
      redirect_to root_page
    end
  end

  def index
  end

  def show
    @id = current_user.id
    @profile = current_user.profile.id
    puts '*'*150
    p @id
    p @profile
    puts '*'*150
  end

  def edit
  end
  
end
