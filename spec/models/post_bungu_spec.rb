# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostBungu, "モデルに関するテスト", type: :model do
  describe 'モデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post_bungu)).to be_valid
    end
  end
end