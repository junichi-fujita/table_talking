require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = create(:user)
  end
  example "ログインする" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログイン"
    
    expect(page).to have_content "ログインしました"
  end
  example "新規登録" do
    visit root_path
    click_link "新規登録"
    fill_in "ユーザー名", with: "sample"
    fill_in "メールアドレス", with: "sample@example.com"
    fill_in "パスワード", with: "aaaaaa"
    fill_in "確認用パスワード", with: "aaaaaa"
    click_button "登録"

    expect(page).to have_content "アカウント登録が完了しました。"
  end
end