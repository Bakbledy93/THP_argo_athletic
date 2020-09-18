class Admins::UsersController < ApplicationController
  before_action :authenticate_admin, only: [:index]

  def authenticate_admin
    unless current_admin
      flash[:alert] = "Unauthorized section"
      redirect_to root_path
    end
  end

  def index
    @disable_footer = true
    @users= User.all
    puts "hello"
  end

  def edit
    @disable_footer = true
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      flash[:alert] = "Le Profil à été mis à jour"
      redirect_to admins_users_path
    else
      flash[:error] = "S'il vous plait, completez tous les champs du formulaire avec le format correct"
      redirect_to request.referrer
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end