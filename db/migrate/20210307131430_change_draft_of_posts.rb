class ChangeDraftOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :draft, :integer, default: 0, null: false
  end
end
