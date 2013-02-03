
var mode = null;

$(document).ready(function(){
  
  $("#settings").load("/settings").hide();
  
});

function showSettings()
{
  $("#settings").show();
}

function hideSettings()
{
  $("#settings").hide();
}

function toggleSettings()
{
  if ( $("#settings:visible").length )
    hideSettings();
  else
    showSettings();
}
