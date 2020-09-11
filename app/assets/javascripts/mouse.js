$(function() {
    $(document).on('page:fetch',   function() { $('body').css( 'cursor', 'progress' ); });
    $(document).on('page:change',  function() { $('body').css( 'cursor', 'default' ); });
});