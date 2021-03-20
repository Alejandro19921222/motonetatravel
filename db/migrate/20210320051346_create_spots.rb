class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :post_id, null: false
      t.string :address, null: false
      t.decimal :latitude,  null: false
      t.decimal :longitube, null: false
      t.timestamps
    end
  end
end
