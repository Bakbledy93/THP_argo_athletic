class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    # display new message
    @message = Message.new
    # display all existing messages
    @messages = Message.most_recent
  end
end
