require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = create(:user)
  end
  example "ログインする" do
    visit root_path
    click_link "ログイン", match: :first
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログイン"
    
    expect(page).to have_content "セッションの作成"
  end
  example "新規登録" do
    visit root_path
    click_on "新規登録", match: :first
    sleep 0.5
    fill_in "name", with: "sample"
    fill_in "email", with: "sample@example.com"
    fill_in "パスワード", with: "aaaaaa"
    fill_in "確認用パスワード", with: "aaaaaa"
    click_button "登録"

    expect(page).to have_content "マイアカウント"
  end
end