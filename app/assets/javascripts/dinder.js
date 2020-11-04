$(function(){
  var $activeCard = $('#card_group .dinder_card:first-child');

  $activeCard.addClass('showing');
 
  $('#decline').on('click', function() {
    console.log('decline')
    goToCard('decline');
  });
   
  $('#like').on('click', function() {
    var restaurant_id = $activeCard.data("id");
    var restaurant_name = $activeCard.data("name");
    var restaurant_address = $activeCard.data("address");
    var restaurant_site = $activeCard.data("site");
    var dinder = $activeCard.data("dinder");
    console.log(restaurant_id);
    console.log(restaurant_name);
    console.log(restaurant_address);
    console.log(restaurant_site);

    $.ajax( "/dinders/like", {

      method: 'POST',
      // dataType: 'ajax'
      data: { zomato_id: restaurant_id,
              address: restaurant_address,
              site: restaurant_site,
              name: restaurant_name,
              dinder: dinder
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

