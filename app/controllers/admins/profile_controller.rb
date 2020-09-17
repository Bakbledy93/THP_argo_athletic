class Admins::ProfileController < ApplicationController
  def index
    @disable_footer = true

  end

  def edit
    @disable_footer = true
    @profile = Profile.find(params[:id])
    @sports_array = Profile.sport_array_creator
    @roles_array = Profile.sport_role_array_creator
    @levels_array = Profile.level_array_creator
  end

  def show
  end

  def update
    @weight = params[:weight]
    @sports = Sport.all
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:alert] = "Le Profil à été mis à jour"
      redirect_to admins_users_path
    else
      flash[:error] = "S'il vous plait, completez tous les champs du formulaire avec le format correct"
      redirect_to request.referrer
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :weight, :height, :sport, :sport_role, :date_of_birth, :level)
  end

end