# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:post_bungu) { create:post_bungu,
                           bungu_name: 'hoge',
                           catchphrase: 'hoge',
                           manufacturer: 2,
                           rate: 2 ,
                           thought: 'hoge',
                           price: 900 ,
                           place: 'hoge'
                    }
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に一覧ページへのリンクが表示されているか' do
        expect(page).to have_link "投稿をもっと見る", href: search_path
      end
      it 'トップ画面(root_path)に文房具詳細ページ(post_bungus/show.html.erb)へのリンクが表示されているか' do
        expect(page).to have_link "", href: post_bungu_path(post_bungu)
      end
      it 'root_pathが"/"であるかどうか' do
        expect(current_path).to eq('/')
      end
    end
  end
  describe "新規投稿画面のテスト" do
    before do
      visit new_post_bungu_path
    end
    context '確認表示' do
      it '投稿フォームが画面に表示されているか' do
        expect(page).to have_field 'post_bungu[catchphrase]'
      end
    end
  end

end