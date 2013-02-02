
var map = null;
  
$(document).ready(function(){
  navigator.geolocation.watchPosition(
    function(pos){
      if ( map == null ) {
        // pos.coords.latitude, pos.coords.longitude, pos.coords.accuracy, new Date(pos.timestamp)
        var h= ( getViewport().height - parseInt($("div.header.navbar.navbar-fixed-top").css("height")) ) - 10;
        console.log( h );
        $("#gmap_canvas").css({
          "height": h + "px"
        });
        var mapOptions = {
          center: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          zoom: 17,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map( $("#gmap_canvas")[0], mapOptions);
        var me = new google.maps.Marker( {
          position: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          map: map
        });
      }
    }, function(e){
      console.log("GPS Exception", e);
    },
    {
      maximumAge: 0,
      enableHighAccuracy: true
    }
  );
});
