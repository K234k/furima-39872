class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         validates :nickname, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
         validates :last_name, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ } 
         validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
end