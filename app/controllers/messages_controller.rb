class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
        # redirect_to chat_path
        ActionCable.server.broadcast 'chatroom_channel', message: render_message(@message),
                                                         user: @message.user.profile.first_name                          
    else
        render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message } )
  end

end