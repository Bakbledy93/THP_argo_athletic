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

puts 'Seed done'