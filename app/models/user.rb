class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password,
            format: { with: PASSWORD_REGEX, message: 'must include both letters and numbers' }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー－一-龠々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー－一-龠々]+\z/ }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
