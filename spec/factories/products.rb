FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    category { "MyString" }
    condition { "MyString" }
    shipping_fee_burden { "MyString" }
    shipping_from { "MyString" }
    shipping_days { "MyString" }
    price { 1 }
  end
end
