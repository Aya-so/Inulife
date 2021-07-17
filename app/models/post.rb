class Post < ApplicationRecord

  validates :caption, presence: true

  has_many :post_comments, dependent: :destroy

  belongs_to :user
  attachment :image

end
