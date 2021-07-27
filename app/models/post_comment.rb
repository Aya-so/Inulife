class PostComment < ApplicationRecord

  validates :comment

  belongs_to :user
  belongs_to :post

end
