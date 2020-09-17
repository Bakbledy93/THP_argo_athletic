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
    @levels_array = Profile.level_array_creator
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(params.require(:profile).permit(:first_name, :last_name, :weight, :height, :sport, :sport_role, :date_of_birth))
    if @profile.valid?
      redirect_to root_path
      flash[:alert] = @profile.errors.full_messages
    else
      flash[:alert] = @profile.errors.full_messages
      redirect_to user_path(params[:id])
    end
  end

  def update
    @id = current_user.id
    @weight = params[:weight]
    @sports = Sport.all
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:alert] = "Le Profil à été mis à jour"
      redirect_to user_path(params[:id])
    else
      flash[:error] = "S'il vous plait, completez tous les champs du formulaire avec le format correct"
      redirect_to edit_user_profile_path(id: @profile, user_id: @id)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :weight, :height, :sport, :sport_role, :date_of_birth, :level)
  end
end
