class CreateExtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :extypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
