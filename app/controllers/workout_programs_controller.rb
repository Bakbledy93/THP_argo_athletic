class WorkoutProgramsController < ApplicationController
  before_action :current_workout_program, only: [:show, :edit, :update]

  def index
    @workout_programs = WorkoutProgram.all
  end

  def show
  end

  def new
    @profile_id = current_user.profile.id
    @workout_program = WorkoutProgram.new
    @profiles_id_arr = WorkoutProgram.array_id_creator(Profile)
    @exercises_name_arr = WorkoutProgram.array_name_creator(Exercise)
    @training_methods_name_arr = WorkoutProgram.array_name_creator(TrainingMethod)
    @levels_name_arr = WorkoutProgram.array_name_creator(Level)
    # @repetitions_name_arr = WorkoutProgram.array_name_creator(Repetition)
    # @recuperations_name_arr = WorkoutProgram.array_name_creator(Recuperation)

  end

  def create
    @workout_program = WorkoutProgram.create!(workout_program_params)

    flash[:info] = "The Workout Program was Created"
    redirect_to workout_program_path(@workout_program)
  end

  def edit
  end

  def update
    @workout_program.update(workout_program_params)

    redirect_to workout_program_path(@workout_program)
  end

  private

  def workout_program_params
    params.require(:workout_program).permit(:exercise, :training_method, :level, :repetition, :recuperation, :profile_id)
  end

  def current_workout_program
    @workout_program = WorkoutProgram.find(params[:id])
  end
end
