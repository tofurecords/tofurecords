
$(function() {
  $('[name="bought[ship]"]:radio').change( function() {
    if($('[id=bought_ship_home]').prop('checked')){
      $('.ship').fadeOut();
      $('.ship01').fadeIn();
    } else if ($('[id=bought_ship_new]').prop('checked')) {
      $('.ship').fadeOut();
      $('.ship02').fadeIn();
    } else if ($('[id=bought_ship_registered1]').prop('checked')) {
      $('.ship').fadeOut();
      $('.ship03').fadeIn();
    }
  });
});

