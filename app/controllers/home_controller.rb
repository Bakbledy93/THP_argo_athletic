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
    @capacities = Capacity.all
    @rolesMuscularGroupCapacities = RolesMuscularGroupCapacity.all
    @trainingmethods = TrainingMethod.all
    @qualities = Quality.all
    @trainingmethodexercises = TrainingMethodExercise.all
    @exercises = Exercise.all
    @exercisevariants = ExerciseVariant.all
    @variants = Variant.all
    @musclevariants = MuscleVariant.all
    @muscles = Muscle.all
    @trainingmethodintensities = TrainingMethodIntensity.all
    @intensities = Intensity.all
    puts "* "*30

    puts "* "*30
  end

end
