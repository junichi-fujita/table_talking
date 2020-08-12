class PlayRoomsController < ApplicationController

  def index
    @play_rooms = PlayRoom.all
  end

  def show
    @play_room = PlayRoom.find(params[:id])
    @chat = current_user.chats.build
    @chats = Chat.includes(:user).order(:id)
  end

  def new
    @play_room = PlayRoom.new
  end

  def create
    play_room = current_user.play_rooms.create(play_room_params)
    render :new
  end

  private

  def play_room_params
    params.require(:play_room).permit(:room_name)
  end

end
