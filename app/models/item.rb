class Item < ApplicationRecord
  belongs_to  :user
  has_one     :order
  has_many    :comments
end