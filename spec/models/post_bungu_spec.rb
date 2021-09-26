# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostBungu, "モデルに関するテスト", type: :model do
  describe 'モデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post_bungu)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "bungu_nameが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      post_bungu = PostBungu.new(bungu_name: '',
                                 catchphrase: 'hoge',
                                 manufacturer: 2,
                                 rate: 2 ,
                                 thought: 'hoge',
                                 price: 900 ,
                                 place: 'hoge'
                                )
      expect(post_bungu).to be_invalid
      expect(post_bungu.errors[:bungu_name]).to include("を入力してください")
    end
    it "catchphraseが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      post_bungu = PostBungu.new(bungu_name: 'hoge',
                                 catchphrase: '',
                                 manufacturer: 2,
                                 rate: 2 ,
                                 thought: 'hoge',
                                 price: 900 ,
                                 place: 'hoge'
                                )
      expect(post_bungu).to be_invalid
      expect(post_bungu.errors[:catchphrase]).to include("を入力してください")
    end
    it "rateが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      post_bungu = PostBungu.new(bungu_name: 'hoge',
                                 catchphrase: 'hoge',
                                 manufacturer: 2,
                                 rate: '' ,
                                 thought: 'hoge',
                                 price: 900 ,
                                 place: 'hoge'
                                )
      expect(post_bungu).to be_invalid
      expect(post_bungu.errors[:rate]).to include("を入力してください")
    end
    it "priceが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      post_bungu = PostBungu.new(bungu_name: 'hoge',
                                 catchphrase: 'hoge',
                                 manufacturer: 2,
                                 rate: 2 ,
                                 thought: 'hoge',
                                 price: '' ,
                                 place: 'hoge'
                                )
      expect(post_bungu).to be_invalid
      expect(post_bungu.errors[:price]).to include("を入力してください")
    end
    it "placeが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      post_bungu = PostBungu.new(bungu_name: 'hoge',
                                 catchphrase: 'hoge',
                                 manufacturer: 2,
                                 rate: 2 ,
                                 thought: 'hoge',
                                 price: 'hoge' ,
                                 place: ''
                                )
      expect(post_bungu).to be_invalid
      expect(post_bungu.errors[:place]).to include("を入力してください")
    end
  end
end
