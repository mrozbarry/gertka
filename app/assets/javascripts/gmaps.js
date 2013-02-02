
(function(){

  var map = null;

  $(document).ready(function(){
    navigator.geolocation.watchPosition(
      function(pos){
        if ( !map ) {
          // pos.coords.latitude, pos.coords.longitude, pos.coords.accuracy, new Date(pos.timestamp)
          var mapOptions = {
            center: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude), zoom: 5, mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          var map = new google.maps.Map( $("#gmap_canvas"), mapOptions);
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
  
})();
