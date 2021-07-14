class Event < ApplicationRecord

  attachment :image

  validates :title, presence: true, uniqueness: true
  validates :introduction, presence: true

  enum order_status: {
    "開催予定": 0,
    "開催中": 1,
    "終了": 2,
}

end
