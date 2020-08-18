class ChatsController < ApplicationController
  def create
    @chat = current_user.chats.build(chat_params)
    @chat.assign_attributes(play_room_id: params[:play_room_id])
    @chat.save
    # room.jsのRoomChannelに送るための設定
    ActionCable.server.broadcast "room_channel", message: @chat.template
  end

  private

  def chat_params
    params.require(:chat).permit(
      :content,
      :play_room_id
    )
  end
end
