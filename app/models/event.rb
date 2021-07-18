class Event < ApplicationRecord

  attachment :image

  validates :title, presence: true, uniqueness: true
  validates :introduction, presence: true

  # 検索
  def Event.search(search, model, how)
    if how == "partical"
  	  Event.where("title LIKE ?", "%#{search}%")
    elsif how == "forward"
  	  Event.where("title LIKE ?", "#{search}%")
    elsif how == "backward"
  	  Event.where("title LIKE ?", "%#{search}")
    elsif how == "match"
  	  Event.where("title LIKE ?", "#{search}")
    end
  end

  has_one :map, dependent: :destroy
  accepts_nested_attributes_for :map

  enum order_status: {
    "開催予定": 0,
    "開催中": 1,
    "終了": 2,
}

end
