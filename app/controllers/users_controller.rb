class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :edit]

  def authenticate_user
    unless current_user
      flash[:danger] = "Accès non autroisée"
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
    set_meta_tags title: current_user.email,
                  site: 'Argo Athletic',
                  reverse: false,
                  description: 'page utilisateur',
                  keywords: ['user', 'users']
  end

  def edit
  end
  
end
