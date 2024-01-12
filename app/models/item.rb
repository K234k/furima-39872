class Item < ApplicationRecord
  # テーブルのアソシエーション
  belongs_to :user
  has_one :order
  has_many :comments

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category  
  belongs_to :item_status  
  belongs_to :shipping_cost
  belongs_to :prefecture  
  belongs_to :shipping_date  

end

 # バリデーション
 validates :name, presence: true, length: { maximum: 40 }
 validates :description, presence: true, length: { maximum: 1000 }
 validates :category, presence: true
 validates :item_status, presence: true
 validates :shipping_cost, presence: true
 validates :prefecture, presence: true
 validates :shipping_date, presence: true
 validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

 validate :validate_image_attachment  # 商品画像の添付が必須

 def validate_image_attachment
  errors.add(:base, '商品画像を添付してください') unless image.attached?
end

