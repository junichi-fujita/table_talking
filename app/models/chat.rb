class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :play_room

  def template
    ApplicationController.renderer.render partial: "chats/chat", locals: { chat: self }
  end
end
