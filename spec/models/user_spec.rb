# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe 'モデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post_bungu)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "nicknameが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      user = User.new( nickname: '',
                       email: 'hoge',
                       password: 'hogehoge'
                     )
      expect(user).to be_invalid
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      user = User.new( nickname: 'hoge',
                       email: '',
                       password: 'hogehoge'
                     )
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordが空白の場合にバリデーションチェックされ、空白のエラーメッセージが帰ってきているか" do
      user = User.new( nickname: 'hoge',
                       email: 'hoge',
                       password: ''
                     )
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end