# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      nickname: 'テスト1さん',
      email: 'test1@test.com',
      password: 'testtest',
      profile_image: File.open("./app/assets/images/test.jpg"),
      self_introduction: 'これはテストです1。'
    },
    {
      nickname: 'テスト2さん',
      email: 'test2@test.com',
      password: 'testtest',
      profile_image: File.open("./app/assets/images/test.jpg"),
      self_introduction: 'これはテストです2。'
    }
  ]
)

Genre.create!(
  [
    { name: 'ボールペン' },
    { name: 'シャープペンシル類' },
    { name: 'カラーペン/マーカー/蛍光ペン' },
    { name: 'シャープペンシル類' },
    { name: 'その他「書くもの」' },
    { name: 'ノート/ルーズリーフ/メモ' },
    { name: '手帳' },
    { name: '付箋' },
    { name: 'その他[書かれるもの]' },
    { name: 'のり/テープのり' },
    { name: 'テーブ/マスキングテーブ' },
    { name: 'シール/スタンプ' },
    { name: '定規/メジャー/ストップウォッチ' },
    { name: 'ペンケース/ファイル' },
    { name: 'その他文房具' }
  ]
)

PostBungu.create!(
   user_id: 1,
   genre_id: 1,
   bungu_name: '文房具1',
   manufacturer: 1,
   catchphrase: '文房具1はすごい!',
   rate: 5,
   thought: 'テスト文房具の良さを語ります。',
   price: 600,
   place: 'ロフト渋谷'
)

BunguImage.create!(
  [
    {
      post_bungu_id: 1,
      image: File.open('./app/assets/images/test_bungu1.jpeg')
    },
    {
      post_bungu_id: 1,
      image: File.open('./app/assets/images/test_bungu2.jpg')
    }
  ]
)


