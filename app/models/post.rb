class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image

  validates :title, presence: true
	validates :body, presence: true

	has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
