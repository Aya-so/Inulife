class Contact < ApplicationRecord

  # validates :name, length: { minimum: 2, maximum: 15 }
  # validates :subject, length: { minimum: 2, maximum: 15 }
  # validates :message, length: { minimum: 2, maximum: 15 }
  # validates :email, length: { minimum: 2 }

  enum order_status: {
    "会員登録について": 0,
    "ログインについて": 1,
    "会員情報の修正について": 2,
    "退会について": 3,
    "サイトのご利用について": 4,
    "写真の投稿について": 5,
    "イベントについて": 6,
    "グループについて": 7,
    "その他": 8,
}

end
