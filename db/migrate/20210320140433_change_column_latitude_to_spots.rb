class ChangeColumnLatitudeToSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :latitude, :float, null: false
  end
end
