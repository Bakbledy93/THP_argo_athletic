# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts'seed begins'

puts'destroy DB'
WorkoutProgram.destroy_all
WorkoutProgram.reset_pk_sequence

User.destroy_all
User.reset_pk_sequence

Profile.destroy_all
Profile.reset_pk_sequence

Admin.destroy_all
Admin.reset_pk_sequence

ExerciseVariant.destroy_all
ExerciseVariant.reset_pk_sequence

TrainingMethodIntensity.destroy_all
TrainingMethodIntensity.reset_pk_sequence

TrainingMethodLevel.destroy_all
TrainingMethodLevel.reset_pk_sequence

TrainingMethodExercise.destroy_all
TrainingMethodExercise.reset_pk_sequence

RolesMuscularGroupCapacity.destroy_all
RolesMuscularGroupCapacity.reset_pk_sequence

Variant.destroy_all
Variant.reset_pk_sequence

Muscle.destroy_all
Muscle.reset_pk_sequence

Extype.destroy_all
Extype.reset_pk_sequence

Level.destroy_all
Level.reset_pk_sequence

Intensity.destroy_all
Intensity.reset_pk_sequence

Exercise.destroy_all
Exercise.reset_pk_sequence

TrainingMethod.destroy_all
TrainingMethod.reset_pk_sequence

MuscularGroup.destroy_all
MuscularGroup.reset_pk_sequence

Capacity.destroy_all
Capacity.reset_pk_sequence

Quality.destroy_all
Quality.reset_pk_sequence

SportRole.destroy_all
SportRole.reset_pk_sequence

Sport.destroy_all
Sport.reset_pk_sequence

puts'creating user'
1.times do |x|
  user = User.create!(
    email: "user@user.com",
    password:"azerty",
    password_confirmation:"azerty",
  )
end

puts'creating admin'
1.times do |x|
  admin = Admin.create!(
    email: "admin@admin.com",
    password:"azerty",
    password_confirmation:"azerty",
  )
end

#import Sport
sports=[]
CSV.foreach('db/sports.csv', headers: true) do |row|
  sports << Sport.new(row.to_h)
end
Sport.import sports, recursive: true

#import SportRole
sports_roles=[]
CSV.foreach("db/sport_roles.csv", headers: true) do |row|
  sports_roles << SportRole.new(row.to_h)
end
SportRole.import sports_roles, recursive: true

#import quality
qualities =[]
CSV.foreach("db/qualities.csv", headers: true) do |row|
  qualities << Quality.new(row.to_h)
end
Quality.import qualities, recursive: true

#import capacity
capacities=[]
CSV.foreach("db/capacities.csv", headers: true) do |row|
  capacities << Capacity.new(row.to_h)
end
Capacity.import capacities, recursive: true

#import MuscularGroup
muscular_groups=[]
CSV.foreach("db/muscular_groups.csv", headers: true) do |row|
  muscular_groups << MuscularGroup.new(row.to_h)
end
MuscularGroup.import muscular_groups, recursive: true

#import Training Method
training_methods =[]
CSV.foreach("db/training_methods.csv", headers: true) do |row|
  training_methods  << TrainingMethod.new(row.to_h)
end
TrainingMethod.import training_methods , recursive: true

#import Exercise
exercises =[]
CSV.foreach("db/exercises.csv", headers: true) do |row|
  exercises  << Exercise.new(row.to_h)
end
Exercise.import exercises , recursive: true

#import Intensity
intensities =[]
CSV.foreach("db/intensities.csv", headers: true) do |row|
  intensities  << Intensity.new(row.to_h)
end
Intensity.import intensities , recursive: true

#Import Level
levels =[]
CSV.foreach("db/levels.csv", headers: true) do |row|
  levels  << Level.new(row.to_h)
end
Level.import levels , recursive: true

#import extype
extypes =[]
CSV.foreach("db/extypes.csv", headers: true) do |row|
  extypes  << Extype.new(row.to_h)
end
Extype.import extypes , recursive: true

#import muscles
muscles=[]
CSV.foreach("db/muscles.csv", headers: true) do |row|
  muscles << Muscle.new(row.to_h)
end
Muscle.import muscles, recursive: true

#import variants
variants=[]
CSV.foreach("db/variants.csv", headers: true) do |row|
  variants << Variant.new(row.to_h)
end
Variant.import variants, recursive: true

#import JT Roles MH Capacities
role_muscular_group_capacities=[]
CSV.foreach("db/role_muscular_group_capacities.csv", headers: true) do |row|
  role_muscular_group_capacities << RolesMuscularGroupCapacity.new(row.to_h)
end
RolesMuscularGroupCapacity.import role_muscular_group_capacities, recursive: true

#import JT Methods Exercises
training_method_exercises=[]
CSV.foreach("db/training_method_exercises.csv", headers: true) do |row|
  training_method_exercises << TrainingMethodExercise.new(row.to_h)
end
TrainingMethodExercise.import training_method_exercises, recursive: true

#Import MethodLevel
method_levels=[]
CSV.foreach("db/method_levels.csv", headers: true) do |row|
  method_levels << TrainingMethodLevel.new(row.to_h)
end
TrainingMethodLevel.import method_levels, recursive: true

#Import Methods Intensities
method_intensities=[]
CSV.foreach("db/method_intensities.csv", headers: true) do |row|
  method_intensities << TrainingMethodIntensity.new(row.to_h)
end
TrainingMethodIntensity.import method_intensities, recursive: true

#Import JT Exercise Variant Muscle
exercise_variants=[]
CSV.foreach("db/exercise_variant_muscles.csv", headers: true) do |row|
  exercise_variants << ExerciseVariant.new(row.to_h)
end
ExerciseVariant.import exercise_variants, recursive: true

puts 'Seed done'