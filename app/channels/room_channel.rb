class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "room_channel"
    play_room = PlayRoom.find(params[:id])
    stream_for play_room
  end

  def unsubscribed
    # チャンネルが登録解除されたときに必要なクリーンアップ
  end

  # def speak(data)
  #   # current_user.chats.create!(content: data['message'])
  #   @chat = current_user.chats.build(chat_params)
  #   @chat.assign_attributes(play_room_id: params[:play_room_id])
  #   @chat.save
  #   ActionCable.server.broadcast 'room_channel'
  # end

end
