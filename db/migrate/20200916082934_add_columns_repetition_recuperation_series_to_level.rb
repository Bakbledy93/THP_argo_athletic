class AddColumnsRepetitionRecuperationSeriesToLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :repetitions, :integer
    add_column :levels, :recuperations, :integer
    add_column :levels, :series, :integer
  end
end
