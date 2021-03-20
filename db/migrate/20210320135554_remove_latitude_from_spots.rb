class RemoveLatitudeFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :latitude, :decimal
  end
end
