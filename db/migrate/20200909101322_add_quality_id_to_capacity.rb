class AddQualityIdToCapacity < ActiveRecord::Migration[5.2]
  def change
    add_reference :capacities, :quality, foreign_key: true
  end
end
