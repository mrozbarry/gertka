var map = null;
var stops = [];
var myPos = null;
var bounds = null;

function update_stops(pos,route) {
  var routeQ = route ? '&route=' + route : '';
  jQuery.ajax("/stops.json?latitude=" + pos.coords.latitude + '&longitude=' + pos.coords.longitude + '&distance=2' + routeQ, {
    dataType: "json",
    success: function(r){
      console.log(r);
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
            var cnt = '<b>' + self.name + '</b>';
            var num = 10;
            $(self.stop_times).each(function(){
              if ( num == 0 ) return;
              cnt += '<br />' + this.route_id + ' at ' + this.arrival_time;
              num -= 1;
            });

          var infowindow = new google.maps.InfoWindow({
            content: cnt
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
  $("#gmap_canvas").css({
    "height": h + "px"
  });
}

$(window).resize(function(){
  updateMapSize();
})

$(document).ready(function(){
  $("form.navbar-search.pull-right").submit(function(){
    update_stops(myPos, $("#route").val());
    return false;
  });

  navigator.geolocation.watchPosition(
    function(pos){
      myPos = pos;
      if ( map == null ) {
        // pos.coords.latitude, pos.coords.longitude, pos.coords.accuracy, new Date(pos.timestamp)<<<<<<< HEAD
        updateMapSize();
        var mapOptions = {
          center: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          draggable: false
        };
        map = new google.maps.Map( $("#gmap_canvas")[0], mapOptions);
/* I know where I am
        var me = new google.maps.Marker( {
          position: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          map: map
        });
*/
      } else {
        map.setCenter( new google.maps.LatLng( pos.coords.latitude, pos.coords.longitude ) );
        bounds = map.getBounds();
      }

     //update_stops(pos);
   }, function(e){
      console.log("GPS Exception", e);
    },
    {
      maximumAge: 0,
      enableHighAccuracy: true
    }
  );
});
