# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  nickname: 'テスト',
  email: 'test@test.com',
  password: 'testtest',
  profile_image: File.open("./app/assets/images/test.jpg"),
  self_introduction: 'これはテストです。'
)

Genre.create!(
  name: 'ボールペン'
)

PostBungu.create!(
   user_id: 1,
   genre_id: 1,
   bungu_name: '文房具1',
   manufacturer: 'パイロット',
   catchphrase: '文房具1はすごい!',
   rate: 5,
   thought: 'テスト文房具の良さを語ります。',
   price: 600,
   place: 'ロフト渋谷'
)

