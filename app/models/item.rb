class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  has_one    :order
  has_one_attached :image  # active_storageとのアソシエーション

  # ActiveHashとのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_date

  # 全ての属性に対する「存在しなければならない」バリデーション
  with_options presence: true do
    validates :user_id, :image, :name, :description, :price
    validates :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id,
              numericality: { other_than: 0 }  # ジャンルの選択が「--」の時は保存不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end