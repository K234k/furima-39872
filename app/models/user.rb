class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         validates :nickname, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
         validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])/ }
         validates :password_confirmation, presence: true
         validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
end