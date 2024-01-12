class Item < ApplicationRecord
  # テーブルのアソシエーション
  belongs_to :user
  has_one :order
  has_many :comments

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category  # ActiveHashモデルのカテゴリーとの関連
end
