class RemoveLongitubeFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :longitube, :decimal
  end
end
