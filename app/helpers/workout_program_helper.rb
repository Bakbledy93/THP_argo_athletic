module WorkoutProgramHelper

  ## INDEX ##
  def current_workout_program
    @workout_program = WorkoutProgram.where(profile_id: current_user.profile.id)
  end

  def declaring_variables_array
    @program1 = []
    @program2 = []
    @program3 = []
    @variant1 = []
    @variant2 = []
    @variant3 = []
  end

  def ex_creator(program, i)
    program.exercise.split(',')[i][2...-1].humanize
  end

  def var_creator(program, i)
    program.variant.split(',')[i][2...-1].humanize
  end

  def program_and_variant_arr_definition

    i = 0
    3.times do |ex|
      @program1 << ex_creator(@workout_program.first, i)
      @variant1 << var_creator(@workout_program.first, i)
      i += 1
    end

    i = 0
    3.times do |ex|
      @program2 << ex_creator(@workout_program.second, i)
      @variant2 << var_creator(@workout_program.second, i)
      i += 1
    end

    i = 0
    3.times do |ex|
      @program3 << ex_creator(@workout_program.third, i)
      @variant3 << var_creator(@workout_program.third, i)
      i += 1
    end

    def check_if_exists(data)
      if data.count > 0
        return true
      end
    end

  end 

    ## SHOW ##

  def array_humanize(array)
    new_array = []
    new_array << array[0][1...-1].humanize
    new_array << array[1][2..-2].humanize
    new_array << array[2][2..-2].humanize
    new_array << array[3][2..-2].humanize
    return new_array
  end

  ## CREATE ##
  def roleMGcap_definition(role_id, priority)
    #return 1 option par pritority et par role 
      #Priorities number goes from 4 to 6 (4 is good for all roles)
    RolesMuscularGroupCapacity.where(sport_role_id: role_id).where(priority: priority)
  end

  def muscles_training_methods_definition(priority)
    @rolesMGcap = roleMGcap_definition(@role_id, priority)
      #return 1 element
    capacities_array = [] # 1 element
    muscles_array = [] # N elements
    @rolesMGcap.each do |rmg|
      capacities_array << Capacity.find(rmg.capacity_id).id
      muscles = Muscle.where(muscular_group_id: rmg.muscular_group_id)
      muscles.each do |m|
        muscles_array << m
      end
    end
      #return 2 Arrays with
        # capaci 1 or Many elements each 

      # every Capacity can have 1 or many muscular groups
    puts "Capacities Array ** "*5
    puts capacities_array
    puts "Muscles Array ** "*5
    puts muscles_array
    puts "END Array ** "*5
    
    # @cap_id = @rolesMGcap.first.capacity_id
      #return 1 element (the first)

    @cap_id = capacities_array[0]
    @training_methods = TrainingMethod.where(capacity_id: @cap_id)
    training_method_array = []
    @training_methods.each do |tmeth|
        training_method_array << tmeth.id
    end

    puts "training_methods Array ** "*5
    puts training_method_array
    puts "END Array ** "*5
    #For 1 capacity we can have MANY Training Methods
    # @training_methods = TrainingMethod.where(capacity_id: @cap_id)
      #return many elements
        # BY CAPACITIES:
          # anaerobic_alactic => 2
          # anaerobic_lactic => 2
          # aerobic => 7
          # max_strength => 6
          # explosive_strength => 7
          # acyclic => 2
          # hpertrophy => 10
          # muscle_endurance => 3


    # Muscles: return 2 or 4 elements
      #For 'Football' muscular group can have 4 options:
        # abs, back, inferior member, superior member (only for goalkeeper)
          #=> 4 Muscles for 'inferior member'
          #=> 2 Muscles for 'abs'
            # abs, obliques
          #=> 2 Muscles for 'back'
            # lowe back, middle back
          #=> 4 Muscles for 'inferior member'
            # calves, quadriceps, hamstring, glutes
          #=> 4 Muscles for 'superior member' (only for goalkeeper)
            # biceps, triceps, forearms, chest (only for goalkeeper)

    #Options:
      # I can use the variables @
      # or
      # I can make an Array with all the data with 
        # Array TrainingMethod inside the main Array
        # Array Muscles inside the main Array

    ## Array with MANY Exercises
      puts "START Methods => Exercises  "*3
      exercises_array = []
      training_method_array.each do |t|
        exercises = TrainingMethod.find(t).exercises
        exercises.each do |ex|
          exercises_array << ex.name
        end
        puts "exercises_array Array ** "*5
        puts exercises_array.uniq
        puts "END Array ** "*5
      end

          # @training_methods.each do |method|
          #   exercises_array << method.exercises
          #   puts "Method Name : #{method.name}"
          #   puts "Method Exercises : #{method.exercises}"
          #   # p method.exercises
          #   puts "Array Exercises: #{exercises_array}"
          #   # p exercises_array
          # end 
      # puts exercises.uniq
      # p exercises.uniq
      
      # puts "MIDDLE Methods => Exercises  "*3
      # exercises.uniq.each do |ex|
      #   puts ex.first.name
      # end
      # puts exercises.uniq
      # puts "END => Exercises  "*3

      exercises_by_muscles_array = []
      muscles_array.each do |m|
        m.exercises.each do |x|
          exercises_by_muscles_array  << x.name
        end 
      end
      puts "exercises_by_muscles_array Array ** "*5
      puts exercises_by_muscles_array.uniq
      puts "END Array ** "*5

      exercises_array_final = exercises_array & exercises_by_muscles_array
      puts "FINAL Array ** "*5
      puts exercises_array_final.uniq
      puts "END Array ** "*5

      return exercises_array_final
  end

  def creating_array_exercises(training_method, muscles)

    ex_array_A = []
    begin
      training_method.sample.exercises.uniq.each do |t|
        ex_array_A << t.name
      end
    rescue
      retry if ex_array_A.length < 5
      puts "Retrying method "*10
      puts "Retrying method "*10
      puts "Retrying method "*10
    end

    ex_array_B = []
    begin
      muscles.each do |m|
        m.exercises.each do |x|
          ex_array_B  << x.name
        end 
      end
    rescue
      retry if ex_array_B.length < 5
      puts "Retrying muscles "*10
      puts "Retrying muscles "*10
      puts "Retrying muscles "*10
    end

    ex_array = ex_array_A & ex_array_B

  end 

  def creating_array_variants(ex_array)
    var_array = []
    ex_array.each do |ex|
      var_array << Exercise.where(name: ex).first.variants.uniq.sample.name 
    end
    var_array
  end

  def exercises_and_variants_array_creation
    @ex_array1 = creating_array_exercises(@training_methods1, @muscles1)
    @ex_array2 = creating_array_exercises(@training_methods2, @muscles2)
    @ex_array3 = creating_array_exercises(@training_methods3, @muscles3)

    @var_array1 = creating_array_variants(@ex_array1)
    @var_array2 = creating_array_variants(@ex_array2)
    @var_array3 = creating_array_variants(@ex_array3)
  end

  def creating_array(array, index)
    new_array = []
    4.times do |i|
      puts " $ "*30
      new_array << array[index]
      index += 1
    end
    return new_array
  end

  def create_workout_program

    program_array = []
    program_array << muscles_training_methods_definition(1)
    program_array << muscles_training_methods_definition(2)
    program_array << muscles_training_methods_definition(3)
    program_array << muscles_training_methods_definition(4)
    program_array << muscles_training_methods_definition(5)
    program_array << muscles_training_methods_definition(6)

    program_array.delete_if {|n| n == []}
    program_array = program_array.join(",").split(",").uniq
    array_to_add = program_array

    puts " $ "*30
    p program_array
    p program_array.length

    5.times do |t|
      program_array << array_to_add.shuffle
    end

    puts " $ "*30
    program_array = program_array.join(",").split(",")
    p program_array
    p program_array.length
    puts " $ "*30

    @ex_array1 = creating_array(program_array, 0)
    @ex_array2 = creating_array(program_array, 4)
    @ex_array3 = creating_array(program_array, 8)

    var_array = creating_array_variants(program_array)
    @var_array1 = creating_array(var_array, 0)
    @var_array2 = creating_array(var_array, 4)
    @var_array3 = creating_array(var_array, 8)


    redirect_to new_workout_program_path

    if program_array.length > 11 
      @workout_program1 = WorkoutProgram.create!(
        exercise: @ex_array1, 
    #     training_method: @training_methods1.sample.name, 
        level:  @level, 
        repetition: @repetitions, 
        recuperation: @recuperation , 
        profile_id: @profile_id, 
        serie: @serie, 
        variant: @var_array1 
      )

      @workout_program2 = WorkoutProgram.create!(
        exercise: @ex_array2, 
    #     training_method: @training_methods2.sample.name, 
        level:  @level, 
        repetition: @repetitions, 
        recuperation: @recuperation , 
        profile_id: @profile_id, 
        serie: @serie, 
        variant: @var_array2 
      )

      @workout_program3 = WorkoutProgram.create!(
        exercise: @ex_array3, 
    #     training_method: @training_methods3.sample.name, 
        level:  @level, 
        repetition: @repetitions, 
        recuperation: @recuperation , 
        profile_id: @profile_id, 
        serie: @serie, 
        variant: @var_array3 
      )

      flash[:notice] = "Le programme d'entraînement à été crée"
    #  redirect_to workout_programs_path
    else
      flash[:notice] = "Une errer s'est produite dans la céation du programme. S'il vous plait essayez à nouveau"
      redirect_to new_workout_program_path
    end
  end


end