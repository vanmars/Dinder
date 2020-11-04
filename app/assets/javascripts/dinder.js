
$(function(){
  
  var $activeCard = $('#card_group .dinder_card:first-child');

  $activeCard.addClass('showing');
 
  
  $('#decline').on('click', function() {
    console.log('decline')
    goToCard('decline');
  });
   
  $('#accept').on('click', function() {
    var restaurant_id = $activeCard.data("id");
    console.log(restaurant_id);

    $.ajax({
      url:"/accept" + restaurant_id,
      method: 'post',
      dataType: 'ajax'
    });
    
    goToCard('accept');
  });
    
  function goToCard(action) {
    $activeCard.removeClass("showing")
    $activeCard = $activeCard.next(".dinder_card")
   

    //send data to controller
    if(action == "accept"){
      
    } else {

    }
    
    $activeCard.addClass("showing")
  }
});

