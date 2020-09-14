class AdminsController < ApplicationController
  before_action :authenticate_admin, only: [:index, :import, :show]

  def authenticate_admin
    unless current_admin
      flash[:danger] = "Unauthorized section"
      redirect_to root_path
    end
  end

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def show
    redirect_to root_path
  end

  def create
    begin
      @admin = Admin.create!(admin_params)
      if @admin.valid?
        redirect_to root_path
        flash[:success] = "A new Admin was successfully created"
      else
        flash[:danger] = "Unauthorized action"
        redirect_to new_admin_path
      end
    rescue
      flash[:danger] = "Email not valid"
      redirect_to new_admin_path
    end

  end

  def update
    @admin.update(admin_params)

    redirect_to root_path
  end


  def import
    @admin = current_admin
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
    @tables = Admin.all_tables
    p @tables
  end

  private

  def all_classes 
    ActiveRecord::Base.connection.class
  end


  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
