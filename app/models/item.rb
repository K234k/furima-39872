class Item < ApplicationRecord
  # テーブルのアソシエーション
  belongs_to :user
  has_one :order
  has_many :comments

  has_one_attached :image # 商品画像の添付を扱う

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  # バリデーション
  validates :name, presence: true, length: { maximum: 40 }
  validates :image, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id,
            numericality: { other_than: 0 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 end