require 'rails_helper'

RSpec.describe 'ParticipantManagement', type: :system do

  let!(:user) { create(:user) }
  let!(:second_user) { create(:second_user) }
  let!(:recruitment) { create(:recruitment) }
  let!(:second_recruitment) { create(:recruitment) }
  let!(:participant_management) { create(
    :participant_management,
    user_id: user.id,
    recruitment_id: recruitment.id
    )}
  let!(:second_participant_management) { create(
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

  example "コメントを投稿する", js:true do

    click_on "詳細", match: :first
    click_on "応募する"
    fill_in "comment", with: "はじめまして"
    # save_and_open_page
    sleep 0.5
    click_on "応募"
    expect(page).to have_content("はじめまして")
    expect(page).to have_content("セッションの詳細")
  end

  example "コメントを編集する",js:true do
    click_on "詳細", match: :first
    click_on "応募する"
    fill_in "comment", with: "はじめまして"
    sleep 0.5
    click_on "応募"
    visit current_path
    sleep 0.5
    click_on "編集"
    fill_in "comment", with: "こんにちは"
    sleep 0.5
    click_on "編集", match: :first
    expect(page).to have_content("こんにちは")

  end

end