require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'ログインリンクが表示される' do
        # binding.pry
        log_in_link = find_all('a')[4].native.inner_text
        expect(log_in_link).to match("ログイン")
      end
      it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(page).to have_link log_in_link, href: '/users/sign_in'
      end
      it '新規登録リンクが表示される' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match("新規登録")
      end
      it '新規登録リンクの内容が正しい' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(page).to have_link sign_up_link, href: '/users/sign_up'
      end
    end
  end

  describe 'ユーザ新規登録テスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it 'ニックネームフォームが表示される' do
        expect(page).to have_field 'user[nickname]'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'パスワード確認フォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '登録ボタンが表示される' do
        expect(page).to have_button '登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[nickname]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end
      
      it '正しく新規登録される' do
        expect { click_button '登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、ルート画面になっている' do
        click_button '登録'
        expect(current_path).to eq '/' 
      end
    end
  end
end