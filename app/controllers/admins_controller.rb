class AdminsController < ApplicationController
  before_action :authenticate_admin, only: [:index, :import]
  # skip_before_action :authenticate_admin, only: [:new]

  def authenticate_admin
    unless current_admin
      flash[:danger] = "Unauthorized section"
      redirect_to root_path
    end
  end

  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create!(params[:email, :password])
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
    params.permit(:email, :password)
  end
end
