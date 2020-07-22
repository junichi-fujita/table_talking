require 'rails_helper'

RSpec.describe Recruitment, type: :model do
  
  let(:recruitment) { create(:recruitment) }

  describe "titleのバリデーション" do
    example "titleが空の場合は無効" do
      recruitment.title = ""
      expect(recruitment).not_to be_valid
    end
    example "titleが31文字以上の場合は無効" do
      recruitment.title = "命" * 31
      expect(recruitment).not_to be_valid
    end
  end
  describe "contentのバリデーション" do
    example "contentが空の場合は無効" do
      recruitment.content = ""
      expect(recruitment).not_to be_valid
    end
    example "contentが256文字以上の場合は無効" do
      recruitment.content = "愛" * 256
      expect(recruitment).not_to be_valid
    end
  end
  describe "appropriate_levelのバリデーション" do
    example "appropriate_levelが空の場合は無効" do
      recruitment.appropriate_level = ""
      expect(recruitment).not_to be_valid
    end
    example "appropriate_levelが0以下の場合は無効" do
      recruitment.appropriate_level = 0
      expect(recruitment).not_to be_valid
    end
  end
  describe "start_timeのバリデーション" do
    example "start_timeが過去の値の場合は無効" do
      recruitment.start_time = DateTime.now -2
      expect(recruitment).not_to be_valid
    end
  end
  describe "play_timeのバリデーション" do
    example "play_timeが空の場合は無効" do
      recruitment.play_time = ""
      expect(recruitment).not_to be_valid
    end
    example "play_timeが0以下の場合は無効" do
      recruitment.play_time = 0
      expect(recruitment).not_to be_valid
    end
  end
end