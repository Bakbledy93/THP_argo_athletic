class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :edit, :show]

  def authenticate_user
    unless current_user
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end  

  def show
    @id = current_user.id
    @profile = current_user.profile.id
    @profile_id = current_user.profile.id

    set_meta_tags title: current_user.email,
                  site: 'Argo Athletic',
                  reverse: false,
                  description: 'page utilisateur',
                  keywords: ['user', 'users']
  end
  
end
