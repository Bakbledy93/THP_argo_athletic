class ChatroomsController < ApplicationController
  def show
    # display new message
    @message = Message.new
    # display all existing messages
    @messages = Message.all
  end
end
