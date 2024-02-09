FactoryBot.define do
  factory :order_form do
    # user_idとitem_idはテストコード内で生成したインスタンスのIDを使用するため、ここでは削除
    postcode { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 47) } # 1は「---」を避ける
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
