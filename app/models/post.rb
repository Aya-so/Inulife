class Post < ApplicationRecord

  validates :caption, presence: true

  # タグ付け
  acts_as_taggable

  has_many :post_comments, dependent: :destroy

  belongs_to :user
  attachment :image

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
