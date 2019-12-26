(function() {
  
  'use strict';

  $('.input-file1').each(function() {
    var $input = $(this),
        $label = $input.next('.js-labelFile'),
        labelVal = $label.html();
    
   $input.on('change', function(element) {
      var fileName = '';
      if (element.target.value) fileName = element.target.value.split('\\').pop();
      fileName ? $label.addClass('has-file').find('.js-fileName1').html(fileName) : $label.removeClass('has-file').html(labelVal);
   });
  });

})();

var starRating = function(){
var $star1 = $(".star1"),
    $result = $star1.find("output>b");
	
  	$(document)
	.on("focusin", ".star1>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star1>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star1 :radio", function(){
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star1 label", function(){
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star1>.input", function(){
    	var $checked = $star1.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
   		 	} else {
     	 		$result.text($checked.next().text());
    		}
  	});
};

starRating();