# class CreateShippingAddresses < ActiveRecord::Migration[7.0]
#   def change
#     create_table :shipping_addresses do |t|
#       t.string :postcode, null: false
#       t.integer :prefecture_id, null: false
#       t.string :city, null: false
#       t.string :block, null: false
#       t.string :building
#       t.string :phone_number, null: false
#       t.references :order, null: false, foreign_key: true

#       t.timestamps
#     end
#   end
# end

# app/forms/order_form.rb
class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "can't be blank. input only number" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end
