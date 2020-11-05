$(function(){
  var $activeCard = $('#card_group .dinder_card:first-child');

  $activeCard.addClass('showing');
 
  $('#decline').on('click', function() {
    goToCard('decline');
  });
   
  $('#like').on('click', function() {
    var restaurant_id = $activeCard.data("id");
    var restaurant_name = $activeCard.data("name");
    var restaurant_address = $activeCard.data("address");
    var restaurant_site = $activeCard.data("site");
    var dinder = $activeCard.data("dinder");
    var api_id = $activeCard.data("api_id");
    
    $.ajax( "/dinders/like", {

      method: 'POST',
      // dataType: 'ajax'
      data: { zomato_id: restaurant_id,
              address: restaurant_address,
              site: restaurant_site,
              name: restaurant_name,
              dinder: dinder,
              api_id: api_id
            }
    });

    goToCard('like');
  });
    
  function goToCard(action) {
    $activeCard.removeClass("showing")
    $activeCard = $activeCard.next(".dinder_card")
   
    //send data to controller
    if(action == "like"){
      
    } else {

    }
    
    $activeCard.addClass("showing")
  }
});

