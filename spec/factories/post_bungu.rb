FactoryBot.define do
  factory :user do
    nickname { Faker::Lorem.characters(number:9) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
  factory :genre do
    name { Faker::Lorem.characters(number:9) }
  end
  factory :post_bungu do
    # user_id { 2 }
    # genre_id { 2 }
    bungu_name { Faker::Lorem.characters(number:9) }
    catchphrase { Faker::Lorem.characters(number:5) }
    manufacturer { 2 }
    rate { 2 }
    thought { Faker::Lorem.characters(number:10) }
    price { 900 }
    place { Faker::Lorem.characters(number:10) }
    association :user
    association :genre
  end
end