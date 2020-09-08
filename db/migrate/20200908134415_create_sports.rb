class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.string :name
      t.boolean :team_sport

      t.timestamps
    end
  end
end
