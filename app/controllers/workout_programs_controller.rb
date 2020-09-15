class WorkoutProgramsController < ApplicationController
  before_action :current_workout_program, only: [:show, :edit, :update]

  def index
    @workout_programs = WorkoutProgram.all
  end

  def show
  end

  def new
    @profile = current_user.profile
    @workout_program = WorkoutProgram.new
    @profiles_id_arr = WorkoutProgram.array_id_creator(Profile)
    @exercises_name_arr = WorkoutProgram.array_name_creator(Exercise)
    @training_methods_name_arr = WorkoutProgram.array_name_creator(TrainingMethod)
    @levels_name_arr = WorkoutProgram.array_name_creator(Level)
    @user = current_user

    ##################################


    @role = @user.profile.sport_role
    @role_id = SportRole.where(name: @role).first.id

    @priority = WorkoutProgram.get_priority
    @data = RolesMuscularGroupCapacity.where(sport_role_id: @role_id).where(priority: @priority)
    
    @mg_id = @data.first.muscular_group_id
    @mg = MuscularGroup.find(@mg_id)
    @cap_id = @data.first.capacity_id
    @cap = Capacity.find(@cap_id)
    @qual = @cap.quality
    
    @training_methods = TrainingMethod.where(capacity_id: @cap_id)
    @muscles = Muscle.where(muscular_group_id: @mg_id)
    
    arr1 = []
    @training_methods.sample.exercises.uniq.each do |t|
      arr1 << t.name
    end

    arr2 = []
    @muscles.each do |m|
      m.exercises.each do |x|
        arr2  << x.name
      end 
    end

    @exercises_arr = arr1 & arr2
    @variants_arr = []
    @exercises_arr.each do |ex|
      puts "ex : "
      puts ex
      puts "var :"
      @variants_arr << Exercise.where(name: ex).first.variants.uniq.sample.name 
    end
    puts @variants_arr
    puts "& - "*30
    puts @exercises_arr
    puts "& - "*30

  end

  def create
    @workout_program = WorkoutProgram.create!(workout_program_params)

    flash[:info] = "The Workout Program was Created"
    redirect_to user_path(current_user.id)
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
