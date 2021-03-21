class ChangeColumnLongitudeToSpots < ActiveRecord::Migration[5.2]
  def changes
    change_column :spots, :longitude, :float, null: false
  end
end
