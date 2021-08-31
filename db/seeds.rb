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
