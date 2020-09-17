class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :edit]

  def authenticate_user
    unless current_user
      flash[:alert] = "Accès non autorisée"
      redirect_to root_page
    end
  end

  def index
  end

  def show
    @id = current_user.id
    @profile = current_user.profile.id
    @profile_id = current_user.profile.id
    @workoutprogram = WorkoutProgram.where(profile_id: @profile_id)
    @exist_program = check_if_exists(@workoutprogram)
    if @exist_program == true
      @ex1 = @workoutprogram.first.id
      @ex2 = @workoutprogram.second.id
      @ex3 = @workoutprogram.third.id
    end
    puts '*'*150
    p @id
    p @profile
    puts '*'*150
    set_meta_tags title: current_user.email,
                  site: 'Argo Athletic',
                  reverse: false,
                  description: 'page utilisateur',
                  keywords: ['user', 'users']
  end

  def edit
    puts " Edit "*25
    flash[:alert] = "User not found."
  end

  def check_if_exists(data)
    if data.count > 0
      return true
    end
  end
  
end
