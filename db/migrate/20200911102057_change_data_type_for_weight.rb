class ChangeDataTypeForWeight < ActiveRecord::Migration[5.2]
  def change
    change_column(:profiles, :weight, :float)
  end
end
