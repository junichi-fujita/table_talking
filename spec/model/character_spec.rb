require 'rails_helper'

RSpec.describe Recruitment, type: :model do

  let(:user) { create(:user)}
  let(:character) { create(:character, user_id: user.id) }

  describe "characterのバリデーション" do
    example "そもまま作成した場合は有効" do
      expect(character).to be_valid
    end
  end
  

  describe "nameのバリデーション" do
    example "nameが空の場合は無効" do
      character.name = ""
      expect(character).not_to be_valid
    end

    example "nameが31文字以上の場合は無効" do
      character.name = "生" * 31
      expect(character).not_to be_valid
    end
  end

    describe "levelのバリデーション" do
      example "levelが空の場合は無効" do
        character.level = ""
        expect(character).not_to be_valid
      end

      example "levelが0以下の場合は無効" do
        character.level = 0
        expect(character).not_to be_valid
      end
    end

    describe "strengthのバリデーション" do
      example "strengthが空の場合は無効" do
        character.strength = ""
        expect(character).not_to be_valid
      end

      example "strengthが0以下の場合は無効" do
        character.strength = 0
        expect(character).not_to be_valid
      end
    end

    describe "agilityのバリデーション" do
      example "agilityが空の場合は無効" do
        character.agility = ""
        expect(character).not_to be_valid
      end

      example "agilityが0以下の場合は無効" do
        character.agility = 0
        expect(character).not_to be_valid
      end
    end
    
    describe "intelligenceのバリデーション" do
      example "intelligenceが空の場合は無効" do
        character.intelligence = ""
        expect(character).not_to be_valid
      end

      example "intelligenceが0以下の場合は無効" do
        character.intelligence = 0
        expect(character).not_to be_valid
      end
    end
    
end