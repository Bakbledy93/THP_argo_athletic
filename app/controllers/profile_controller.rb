class ProfileController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
  end
  
  def edit
    @profile = Profile.find(params[:id])
    @sports_array = Profile.sport_array_creator
    @roles_array = Profile.sport_role_array_creator
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(params.require(:profile).permit(:weight, :height, :sport, :sport_role, :date_of_birth))
    if @profile.valid?
      redirect_to root_path
      flash[:error] = @profile.errors.full_messages
    else
      flash[:error] = @profile.errors.full_messages
      redirect_to user_path(params[:id])
    end
  end

  def update
    @sports = Sport.all
    @profile = Profile.find(params[:id])
    @profile.update(params.require(:profile).permit(:weight, :height, :sport, :sport_role, :date_of_birth))
    flash[:error] = "Le Profil à été mis à jour"
    redirect_to user_path(params[:id])
  end
end
