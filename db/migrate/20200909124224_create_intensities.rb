class CreateIntensities < ActiveRecord::Migration[5.2]
  def change
    create_table :intensities do |t|
      t.string :name

      t.timestamps
    end
  end
end
