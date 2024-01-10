FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'振真'}
    first_name            {'西都'}
    last_name_kana        {'フリマ'}
    first_name_kana       {'サイト'}
   birthday               {Faker::Date.birthday}
  end
end