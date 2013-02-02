var map = null;

var stops = [];
var myPos = null;

function update_stops(pos,route) {
  var routeQ = route ? '&route=' + route : '';
  jQuery.ajax("/stops.json?latitude=" + pos.coords.latitude + '&longitude=' + pos.coords.longitude + '&distance=10' + routeQ, {
    dataType: "json",
    success: function(r){
      $(stops).each(function(){
        this.setMap(null);
      });

      $(r).each(function(){
        var self = this;

        // TODO: fancy bus icon or whatever
        var stopMarker = new google.maps.Marker({
          position: new google.maps.LatLng(this.latitude, this.longitude),
          map: map,
          flat: true,
          title: '[' + this.stop_id + '] ' + this.name
        });
        google.maps.event.addListener(stopMarker, 'click', function() {
          var infowindow = new google.maps.InfoWindow({
            content: self.name // TODO: useful data goes here
          });
          infowindow.open(map, stopMarker);
        });
        stops.push(stopMarker);
      });
    }
  });
}

function updateMapSize()
{
  var h= ( getViewport().height - $("div.header.navbar.navbar-fixed-top").height() ) - 50;
  console.log( h );
  $("#gmap_canvas").css({
    "height": h + "px"
  });
}

$(window).resize(function(){
  updateMapSize();
})

$(document).ready(function(){
  $('#route').keyup(function(){
    update_stops(myPos, $(this).val());
  });

  navigator.geolocation.watchPosition(
    function(pos){
      myPos = pos;
      if ( map == null ) {
        // pos.coords.latitude, pos.coords.longitude, pos.coords.accuracy, new Date(pos.timestamp)<<<<<<< HEAD
        updateMapSize();
        var mapOptions = {
          center: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          zoom: 17,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map( $("#gmap_canvas")[0], mapOptions);
/* I know where I am
        var me = new google.maps.Marker( {
          position: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          map: map
        });
*/
      } else {
        map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
      }

     update_stops(pos);
   }, function(e){
      console.log("GPS Exception", e);
    },
    {
      maximumAge: 0,
      enableHighAccuracy: true
    }
  );
});
