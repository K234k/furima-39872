class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         validates :nickname, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
         validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])/ }
         validates :password_confirmation, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birthday, presence: true
end