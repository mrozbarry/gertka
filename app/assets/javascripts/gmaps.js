
var map = null;
  
console.log( google, "i'm here lol" );

$(document).ready(function(){
  navigator.geolocation.watchPosition(
    function(pos){
      if ( map == null ) {
        console.log( pos );
        // pos.coords.latitude, pos.coords.longitude, pos.coords.accuracy, new Date(pos.timestamp)
        console.log( "woo" )
        var mapOptions = {
          center: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          zoom: 5,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map( $("#gmap_canvas")[0], mapOptions);
      } else {
        console.log( "Position already grabbed" )
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
