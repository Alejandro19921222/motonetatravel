class AddPostIdFromPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :post_id, :integer
  end
end
