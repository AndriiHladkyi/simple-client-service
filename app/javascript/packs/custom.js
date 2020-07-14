window.addEventListener('load', function () {
  $('.main-address').on('change', function() {
    $('.main-address').not(this).prop('checked', false);  
  });

  $('.main-phone-number').on('change', function() {
    $('.main-phone-number').not(this).prop('checked', false);  
  });
});