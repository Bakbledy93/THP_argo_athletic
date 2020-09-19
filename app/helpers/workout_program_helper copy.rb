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

  # def training_method_array_creation(priority)
  #   @rolesMGcap = roleMGcap_definition(@role_id, priority)
  #   @cap_id = @rolesMGcap.first.capacity_id
  #   @training_methods = TrainingMethod.where(capacity_id: @cap_id)
  #   @mg_id = @rolesMGcap.first.muscular_group_id
  #   @muscles = Muscle.where(muscular_group_id: @mg_id)
  # end

  # def muscles_array_creation(priority)
  #   @rolesMGcap = roleMGcap_definition(@role_id, priority)
  #   @mg_id = @rolesMGcap.first.muscular_group_id
  #   @muscles = Muscle.where(muscular_group_id: @mg_id)
  # end

  def muscles_training_methods_definition(priority)
    @rolesMGcap = roleMGcap_definition(@role_id, priority)
      #return 1 element
    @cap_id = @rolesMGcap.first.capacity_id
      #return 1 element
    @mg_id = @rolesMGcap.first.muscular_group_id
      #return 1 element
    @muscles = Muscle.where(muscular_group_id: @mg_id)
    #return 2 or 4 elements
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
      # I can make an Array with all the data with Array Muscles inside the main Array


    # @rolesMGcap1 = roleMGcap_definition(@role_id, 1)
    # @cap_id1 = @rolesMGcap1.first.capacity_id
    # @training_methods1 = TrainingMethod.where(capacity_id: @cap_id1)
    # @mg_id1 = @rolesMGcap1.first.muscular_group_id
    # @muscles1 = Muscle.where(muscular_group_id: @mg_id1)

    # @rolesMGcap2 = roleMGcap_definition(@role_id, 1)
    # @cap_id2 = @rolesMGcap2.first.capacity_id
    # @training_methods2 = TrainingMethod.where(capacity_id: @cap_id2)
    # @mg_id2 = @rolesMGcap2.first.muscular_group_id
    # @muscles2 = Muscle.where(muscular_group_id: @mg_id2)

    # @rolesMGcap3 = roleMGcap_definition(@role_id, 1)
    # @cap_id3 = @rolesMGcap3.first.capacity_id
    # @training_methods3 = TrainingMethod.where(capacity_id: @cap_id3)
    # @mg_id3 = @rolesMGcap3.first.muscular_group_id
    # @muscles3 = Muscle.where(muscular_group_id: @mg_id3)
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

  def create_workout_program
    # @ex_array1 = ["uno", "dos"]
    # @ex_array2 = ["uno", "dos"]
    # @ex_array3 = ["uno", "dos"]
    puts "Length  "*10
    puts @ex_array1.length
    puts @ex_array2.length
    puts @ex_array3.length
    puts "Length  "*10
    if @ex_array1.length > 3 && @ex_array2.length > 3 && @ex_array3.length > 3 
      @workout_program1 = WorkoutProgram.create!(
        exercise: @ex_array1, 
        training_method: @training_methods1.sample.name, 
        level:  @level, 
        repetition: @repetitions, 
        recuperation: @recuperation , 
        profile_id: @profile_id, 
        serie: @serie, 
        variant: @var_array1 
      )

      @workout_program2 = WorkoutProgram.create!(
        exercise: @ex_array2, 
        training_method: @training_methods2.sample.name, 
        level:  @level, 
        repetition: @repetitions, 
        recuperation: @recuperation , 
        profile_id: @profile_id, 
        serie: @serie, 
        variant: @var_array2 
      )

      @workout_program3 = WorkoutProgram.create!(
        exercise: @ex_array3, 
        training_method: @training_methods3.sample.name, 
        level:  @level, 
        repetition: @repetitions, 
        recuperation: @recuperation , 
        profile_id: @profile_id, 
        serie: @serie, 
        variant: @var_array3 
      )

      flash[:notice] = "Le programme d'entraînement à été crée"
      redirect_to workout_programs_path
    else
      flash[:notice] = "Une errer s'est produite dans la céation du programme. S'il vous plait essayez à nouveau"
      redirect_to new_workout_program_path
    end
  end


end