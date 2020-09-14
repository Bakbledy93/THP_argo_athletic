class AdminsController < ApplicationController
  before_action :authenticate_admin, only: [:index, :import]

  def authenticate_admin
    unless current_admin
      flash[:danger] = "Unauthorized section"
      redirect_to root_path
    end
  end

  def index
  end

  def new

  end

  def create

  end


  def import
    @sports = Sport.all
    @sportrole = SportRole.all
    @quality = Quality.all
    @capacity = Capacity.all
    @muscular_group = MuscularGroup.all
    @training_method = TrainingMethod.all
    @exercises = Exercise.all
    @intensities = Intensity.all
    @levels = Level.all
    @extypes = Extype.all
    @muscles = Muscle.all
    @variants = Variant.all
    @roles = RolesMuscularGroupCapacity.all
    @methodexercises = TrainingMethodExercise.all
  end

end
