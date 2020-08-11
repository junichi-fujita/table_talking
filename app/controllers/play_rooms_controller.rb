class PlayRoomsController < ApplicationController

  def show
    @chats = Chat.includes(:user).order(:id)
    @chat = current_user.chats.build    
  end
end
