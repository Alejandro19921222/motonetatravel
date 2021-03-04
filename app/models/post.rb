class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image

  validates :title, presence: true
	validates :body, presence: true
end
