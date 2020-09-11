class WorkoutprogramsController < ApplicationController
  def show
    @workout = WorkoutProgram.find(params[:id])
  end

  def edit
    @workout = WorkoutProgram.find(params[:id])
  end

  def update
    @workout = WorkoutProgram.find(params[:id])
    @workout.update(post_params)
    redirect_to workoutprograms_root

  end

  def create
    workout = WorkoutProgram.create(post_params)
    redirect_to workoutprogram_path(workout.id)
  end


  def post_params
    post_params = params.require(:workout).permit(:exercise, :training_method, :level, :repetition, :recuperation)
  end
end
