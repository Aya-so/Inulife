class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true
  validates :introduction, presence: true
  validates :name_id, uniqueness: true, format: { with: /\A[a-zA-Z\d]+\z/ }, length: { minimum: 2, maximum: 15 }

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :group_users
  has_many :group_posts
  has_many :groups, through: :group_users

  # 検索
  def User.search(search, model, how)
    if model == "user"
      if how == "partical"
        User.where("name_id LIKE ?", "%#{search}%")
      elsif how == "forward"
        User.where("name_id LIKE ?", "#{search}%")
      elsif how == "backward"
        User.where("name_id LIKE?", "%#{search}")
      elsif how == "match"
        User.where("name_id LIKE?", "#{search}")
      end
    end
  end

  def to_param
    return self.name_id
  end

  #カスタムバリデート
  validate :name_id_valid?

  private
  def name_id_valid?
    errors.add(:name_id) if name_id.include?('sign_in') || name_id.include?('sign_up')
  end

end
