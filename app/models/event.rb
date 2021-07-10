class Event < ApplicationRecord

  attachment :image

  validates :title, presence: true
  validates :introduction, presence: true

end
