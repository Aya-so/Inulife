class Group < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true, uniqueness: true

  has_many :group_users
  has_many :users, through: :group_users
  has_many :group_posts

  accepts_nested_attributes_for :group_users

  # 検索
  def Group.search(search, model, how)
    if model == "group"
      if how == "partical"
        Group.where("name LIKE ?", "%#{search}%")
      elsif how == "forward"
        Group.where("name LIKE ?", "#{search}%")
      elsif how == "backward"
        Group.where("name LIKE?", "%#{search}")
      elsif how == "match"
        Group.where("name LIKE?", "#{search}")
      end
    end
  end

end
