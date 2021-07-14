class Group < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :group_users
  has_many :users, through: :group_users

  accepts_nested_attributes_for :group_users

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true, uniqueness: true

end
