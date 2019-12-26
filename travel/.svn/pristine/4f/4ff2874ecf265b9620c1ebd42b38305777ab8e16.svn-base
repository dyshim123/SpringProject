(function () {
  $('.js-input').click(function () {
    $('.js-input').removeClass('is-field-active');
    $(this).addClass('is-field-active');
  });
  
  $('.js-input input').on('input', function () {
    var $parent = $(this).parent('.js-input');
    if ( $(this).val().length >= 1) {
      $parent.addClass('is-field-withInput');
    } else {
      $parent.removeClass('is-field-withInput');
    }
  });
  
  $('.js-inputEmail').on('blur', function () {
    
    var $parent = $(this).parent('.js-input');
    
    $(this).mailcheck({
      suggested: function(element, suggestion) {
        if (suggestion) {
          $('.js-suggestedEmail').html(suggestion.full);
          $parent.addClass('is-field-withEmailSuggestion');
          $parent.addClass('is-field-notice');
        }
      },
      empty: function(element) {
        $parent.removeClass('is-field-withEmailSuggestion');
        $parent.removeClass('is-field-notice');
      }
    });
  });
  
  $('.js-suggestedEmail').click(function () {
    var $parent = $(this).closest('.js-input');
    
    $('.js-inputEmail').val( $(this).html() );
    $parent.removeClass('is-field-withEmailSuggestion');
    
    $parent.removeClass('is-field-notice');
    $parent.addClass('is-field-success');
  });
  
  $('.js-inputPassword').on('input', function () {
    var $parent = $(this).parent('.js-input');
    if ( $(this).val().length >= 1) {
      $parent.addClass('is-field-withInput');
      $parent.addClass('is-field-error');
      $parent.addClass('is-field-badPassword');
      $parent.addClass('is-field-withPassword');
      
      $parent.removeClass('is-field-notice');
      $parent.removeClass('is-field-mediumPassword');
      
      if ( $(this).val().length >= 6) {
        $parent.removeClass('is-field-withPassword');
        $parent.removeClass('is-field-badPassword');
        $parent.removeClass('is-field-error');
        $parent.removeClass('is-field-success');
        
        $parent.addClass('is-field-notice');
        $parent.addClass('is-field-mediumPassword');
      }
      
      if ( $(this).val().length >= 10 ) {
        $parent.removeClass('is-field-mediumPassword');
        $parent.removeClass('is-field-notice');
        
        $parent.addClass('is-field-success');
      }
    } else {
      $parent.removeClass('is-field-withInput');
    }
  });
  
  $('.js-input-fullName').on('blur', function () {
    
    var $parent = $(this).parent('.js-input');
    
    if ( $(this).val().length >= 1) {
      $parent.addClass('is-field-success');
    } else {
      $parent.removeClass('is-field-success');
    }
  });
}());





