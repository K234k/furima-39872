class User < ApplicationRecord
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])/ }
  validates :password_confirmation, presence: true
  # 他のバリデーションも追加する

  # 本人情報確認のバリデーション
  validates :full_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :full_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
