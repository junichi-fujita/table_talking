class CharactersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_character, only: %i[ show edit update destroy ]

  def show
    
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.assign_attributes(
      max_hit_point: @character.level * 10,
      max_magic_point: @character.level * 10,
      attack: @character.strength,
      defense: ((@character.strength + @character.agility) / 2).ceil,
      evasion: @character.agility
    )
    @user = User.find(current_user.id)
    @character.user = @user
    if @character.save!
      redirect_to @character, notice: "キャラクターを作成しました"
    else
      render :new
    end
  end

  def edit

  end

  def update
    @character.assign_attributes(character_params)
    @character.assign_attributes(
      max_hit_point: @character.level * 10,
      max_magic_point: @character.level * 10,
      attack: @character.strength,
      defense: ((@character.strength + @character.agility) / 2).ceil,
      evasion: @character.agility
    )
    if @character.save!
      redirect_to @character, notice: "キャラクターを編集しました"
    end
  end

  def destroy
    @character.destroy
    redirect_to user_path(current_user), notice: "キャラクターを削除しました"
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      :race,
      :job,
      :level,
      :strength,
      :intelligence,
      :agility,
      :money,
      :stock,
      :experience,
    )
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
