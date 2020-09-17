module WorkoutProgramHelper

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
end