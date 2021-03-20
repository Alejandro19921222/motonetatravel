class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
	validates :body, presence: true

	has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  def self.looks(searches, words)
    if searches == "perfect_match"
      @post = Post.where("title LIKE ?", "#{words}")
    else
      @post = Post.where("title LIKE ?", "%#{words}%")
    end
  end


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum draft: { published: 0, draft: 1 }

end
