class DeletingColumnTypeFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :type
  end
end
