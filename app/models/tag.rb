class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts, through: :tag_maps

  def self.looks(searches, words)
    if searches == "perfect_match"
      @tag = Tag.where("name LIKE ?", "#{words}")
    else
      @tag = Tag.where("name LIKE ?", "%#{words}%")
    end
  end

end
