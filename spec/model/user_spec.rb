require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = build(:user)
    @second_user = build(:second_user)
  end

  describe "emailのバリデーション" do
    example "emailの値が空の場合無効" do
      @user.email = ""
      expect(@user).not_to be_valid
    end
    example "@を2個含むemailは無効" do
      @user.email = "test@@example.com"
      expect(@user).not_to be_valid
    end
    example "重複したメールアドレスのemailは無効" do
      @user.save
      @second_user.email = "test@example.com"
      expect(@second_user).not_to be_valid
    end
  end

  describe "nameのバリデーション" do
    example "空のnameは無効" do
      @user.name = ""
      expect(@user).not_to be_valid
    end
    example "nameの値が31文字以上なら無効" do
      @user.name = "a" * 31
      expect(@user).not_to be_valid
    end
  end

  describe "passwordのバリデーション" do
    example "空のpasswordは無効" do
      @user.password = ""
      expect(@user).not_to be_valid
    end
    example "passwordの値が6文字未満の場合無効" do
      @user.password = "a" * 5
      expect(@user).not_to be_valid
    end
  end

end