# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  # let!(:post_bungu) { create:post_bungu,
  #                       bungu_name: 'hoge',
  #                       catchphrase: 'hoge',
  #                       manufacturer: 2,
  #                       rate: 2 ,
  #                       thought: 'hoge',
  #                       price: 900 ,
  #                       place: 'hoge',
  #                       genre_id: 2
  #                   }
  let!(:post_bungu) { create(:post_bungu) }
  let!(:user) { create(:user) }

  #ログイン状態にする
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

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

    context '表示確認' do
      it '投稿フォームが画面に表示されているか' do
        # byebug
        expect(page).to have_field 'post_bungu[catchphrase]'
        expect(page).to have_field 'post_bungu[bungu_name]'
        expect(page).to have_field 'post_bungu[thought]'
        expect(page).to have_field 'post_bungu[price]'
        expect(page).to have_field 'post_bungu[place]'
      end
      it 'Create Bookボタンが表示される' do
	      expect(page).to have_button '投稿する'
      end
    end

    context '投稿処理に関するテスト' do
      before do
        fill_in 'post_bungu[bungu_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'post_bungu[catchphrase]', with: Faker::Lorem.characters(number: 20)
        fill_in 'post_bungu[thought]', with: Faker::Lorem.characters(number: 20)
        fill_in 'post_bungu[price]', with: Faker::Number.between(to: 5000)
        fill_in 'post_bungu[place]', with: Faker::Lorem.characters(number: 5)
        # fill_in 'post_bungu[rate]', with: Faker::Number.between(from: 1, to: 5)
        # find('#rate-stars').find("img[alt='4']").click
        choose 'コクヨ'
        expect(page).to have_checked_field 'コクヨ'
        select 'シャープペンシル類', from: 'post_bungu[genre_id]'
        # fill_in 'post_bungu[genre_id]', with: Faker::Number.between(from: 1, to: 5)
      end

      it '新しい投稿が正しく保存される' do
        click_button '投稿する'
        expect(current_path).to eq post_bungu_path(PostBungu.last)
      end
    end
  end

end