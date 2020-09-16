// goes to the bottom of messages

function scrollToBottom(){
    if($('#messages').length > 0) {
      $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
  }
  
  $(document).ready(function() {
    scrollToBottom();
  });