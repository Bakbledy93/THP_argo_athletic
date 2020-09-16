class HomeController < ApplicationController
  def index
  end

  def import
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @sports = Sport.all
    @musculargroups = MuscularGroup.all
    @roles = SportRole.all
    @role = @user.profile.sport_role
    @role_id = SportRole.where(name: @role).sample.id
    @capacities = Capacity.all
    @rolesMuscularGroupCapacities = RolesMuscularGroupCapacity.all
    @trainingmethods = TrainingMethod.all
    @qualities = Quality.all
    @trainingmethodexercises = TrainingMethodExercise.all
    @exercises = Exercise.all
    @exercisevariants = ExerciseVariant.all
    @variants = Variant.all
    @muscles = Muscle.all
    @trainingmethodintensities = TrainingMethodIntensity.all
    @intensities = Intensity.all

    ##Filtres
    @inferior_member = MuscularGroup.where(name: "inferior_member")
    @inferior_member_id = @inferior_member.sample.id
  end

  def contact
  end

end
