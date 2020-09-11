class UsersController < ApplicationController
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
