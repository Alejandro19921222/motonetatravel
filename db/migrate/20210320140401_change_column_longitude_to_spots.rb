class ChangeColumnLongitudeToSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :longitude, :float, null: false
  end
end
