class AddColumnLevelToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :level, :string
  end
end
