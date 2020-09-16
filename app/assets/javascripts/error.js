/* function to fade out the error alert after a determined time */
function fade_after_time(fade_out_time) {

  $(document).ready(function(){
    setTimeout(function(){
      $('#notice_wrapper').fadeOut("slow", function() {
        $(this).remove();
      })
    }, fade_out_time) ;
  });
}


/* main */

// variable that defines in seconds the fade out time
let fade_out_time = 1800 ;
// call function to fade out the error alter after a determined time
fade_after_time(fade_out_time) ;
