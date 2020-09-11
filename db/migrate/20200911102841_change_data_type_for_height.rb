class ChangeDataTypeForHeight < ActiveRecord::Migration[5.2]
  def change
    change_column(:profiles, :height, :float)
  end

end
