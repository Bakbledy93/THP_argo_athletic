class AdminsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
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
  end

end
