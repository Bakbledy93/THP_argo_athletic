class WorkoutProgramsController < ApplicationController
  include WorkoutProgramHelper
  before_action :current_workout_program, only: [:destroy, :index]

  def index
    @workout_programs = WorkoutProgram.all
    declaring_variables_array
    program_and_variant_arr_definition  
    @profile_id = current_user.profile.id
    @workoutprogram = WorkoutProgram.where(profile_id: @profile_id)
    
    @exist_program = check_if_exists(@workoutprogram)
    if @exist_program == true
      @ex1 = @workoutprogram.first.id
      @ex2 = @workoutprogram.second.id
      @ex3 = @workoutprogram.third.id
    end
  end

  def check_if_exists(data)
    if data.count > 0
      return true
    end
  end

  def show
    @current_program_id = params[:program_id]
    @day = params[:day]
    @wk_ex = WorkoutProgram.find(@current_program_id).exercise[1..-2].split(",")
    @wk_var = WorkoutProgram.find(@current_program_id).variant[1..-2].split(",")
    @repetition  = WorkoutProgram.find(@current_program_id).repetition
    @recuperation  = WorkoutProgram.find(@current_program_id).recuperation
    @serie  = WorkoutProgram.find(@current_program_id).serie

    @program = array_humanize(@wk_ex)
    @variant = array_humanize(@wk_var)
  end

  def new
    @user = current_user
    @level = @user.profile.level
    @sport = @user.profile.sport
    @role = @user.profile.sport_role
  end

  def create
    @user = current_user
    @profile = current_user.profile
    @profile_id = current_user.profile.id
    @level = @user.profile.level
    @sport = @user.profile.sport
    @role = @user.profile.sport_role
    @role_id = SportRole.where(name: @role).first.id
    @repetitions = Level.where(name: @level).first.repetitions
    @recuperation = Level.where(name: @level).first.recuperations
    @serie = Level.where(name: @level).first.series
    
    muscles_training_methods_definition
    exercises_and_variants_array_creation
    create_workout_program

    flash[:notice] = "Le programme d'entraînement à été crée"
    redirect_to user_path(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @workout_program.destroy_all

    flash[:notice] = "Le programme d'entraînement à été suprimé. Merci de créer un nouveau programme"
    redirect_to user_path(current_user.id)
  end
  
end
