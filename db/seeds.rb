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
      nickname: 'テスト1',
      email: 'test1@test.com',
      password: 'testtest',
      self_introduction: 'こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。'
    },
    {
      nickname: 'テスト2',
      email: 'test2@test.com',
      password: 'testtest',
      self_introduction: 'こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。こんにちは。'
    }
  ]
)

Genre.create!(
  [
    { name: 'ボールペン' },
    { name: 'シャープペンシル類' },
    { name: 'カラーペン/マーカー/蛍光ペン' },
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
  [
    {
      user_id: 1,
      genre_id: 1,
      bungu_name: 'kurutoga',
      manufacturer: 2,
      catchphrase: '書いても書いてもとんがっている！',
      rate: 5,
      thought: 'これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。',
      price: 390,
      place: 'ロフト渋谷'
    },
    {
      user_id: 1,
      genre_id: 1,
      bungu_name: 'kurutoga',
      manufacturer: 2,
      catchphrase: '書いても書いてもとんがっている！',
      rate: 5,
      thought: 'これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。',
      price: 390,
      place: 'ロフト渋谷'
    },
    {
      user_id: 2,
      genre_id: 7,
      bungu_name: 'ロルバーン手帳',
      manufacturer: 2,
      catchphrase: '表紙が可愛い！書きたくなる手帳',
      rate: 5,
      thought: 'これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。',
      price: 1210,
      place: 'ロフト渋谷'
    },
    {
      user_id: 2,
      genre_id: 7,
      bungu_name: 'ロルバーン手帳',
      manufacturer: 2,
      catchphrase: '表紙が可愛い！書きたくなる手帳',
      rate: 5,
      thought: 'これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。これはテストです。',
      price: 1210,
      place: 'ロフト渋谷'
    }
  ]
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


