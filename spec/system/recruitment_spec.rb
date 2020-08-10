require 'rails_helper'

RSpec.describe 'Recruitment', type: :system do

  let!(:user) { create(:user) }
  let!(:recruitment) { create(:recruitment) }
  let!(:participant_management) { create(
    :participant_management,
    user_id: user.id,
    recruitment_id: recruitment.id
    )}

  

  before do
    visit root_path
    click_link "ログイン", match: :first
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン" 
  end
  
  example "セッションを作成する" do
    click_on "セッションの作成"
    fill_in "セッション名", with: "初めてのTRPG"
    fill_in "詳細内容", with: "一緒にTRGを始めませんか？"
    fill_in "適正レベル", with: 1
    # select_date('2020,8月,1,', from: "予定開始時間")
    # select_time('00','00', from: "予定開始時間")
    fill_in "予定プレイ時間", with: 2
    click_button "登録する"
    expect(page).to have_content("初めてのTRPG")
  end

  example "イベントの詳細を表示する" do
    click_on "詳細", match: :first
    expect(page).to have_content("セッションの詳細") 
  end

  example "タイトルで検索する" do
    fill_in "q_title_cont", with: "test_title"
    click_button "検索"
    expect(page).to have_content("2")
    expect(page).not_to have_content("second_title")
  end
end