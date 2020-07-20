require 'rails_helper'

RSpec.describe 'Recruitment', type: :system do
  before do
    @user = create(:user)
    @second_user = create(:second_user)
    @recruitment = create(:recruitment)
    @second_recruitment = create(:second_recruitment)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログイン" 
  end
  
  example "イベントを作成する" do
    click_on "イベントの作成"
    fill_in "タイトル", with: "初めてのTRPG"
    fill_in "募集内容", with: "一緒にTRGを始めませんか？"
    fill_in "適正レベル", with: 1
    select_date('2020,8月,1,', from: "予定開始時間")
    select_time('00','00', from: "予定開始時間")
    fill_in "予定プレイ時間", with: 2
    click_button "登録する"
    expect(page).to have_content("初めてのTRPG")
  end

  example "イベントの詳細を表示する" do
    click_on "詳細", match: :first
    expect(page).to have_content("募集内容") 
  end
end