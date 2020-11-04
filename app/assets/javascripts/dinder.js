
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
      url:"/dinders/approve/" + restaurant_id,
      method: 'post',
      dataType: 'ajax'
    });

    // $.ajax("/dinders/accept/" + restaurant_id);

    
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

