App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    //
  disconnected: ->
    //
  received: (data) ->
    $('#messages').append data['message']
    $('#message_content').val ''
    scrollToBottom()
    return