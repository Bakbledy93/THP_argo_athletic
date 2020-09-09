class CreateTrainingMethodIntensities < ActiveRecord::Migration[5.2]
  def change
    create_table :training_method_intensities do |t|
      t.references :intensity, foreign_key: true
      t.references :training_method, foreign_key: true

      t.timestamps
    end
  end
end
