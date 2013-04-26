// Android //
$('#home').on('pageinit', function(){
	//alert("Welcome to my AVF Demo App!");
});

$('#twitter').on('click', function(){
	
	
});

$('#device').on('click', function(){

});




    // ------  Twitter DATA  -------//
var getData = function() {
	var twitterSearch = $('#twitterSearch').val();
	$.getJSON('http://search.twitter.com/search.json?q=' + twitterSearch + '&rpp=10&lang=en&include_entities=true&result_type=mixed&callback=?',
            function(data) {
            console.log(data);
            for (i=0, j=data.results.length; i<j; i++) {
            $("#tweets")
            .append(
                    "<li>" +
                     "<img src='" +
                     data.results[i].profile_image_url + "' />" +
                     "<h1>" +
                     data.results[i].from_user_name +
                     "<br />" +
                     "<br />" +
                     "<p>" +
                     data.results[i].text
                      );
            }
            $("#tweets").listview("refresh");
            });
    };

$('#getData').on('click', function() {
	getData();
});
	
$('#clear').on('click', function() {
	location.reload();
});
    
//------------------------------------------------------------------------//

//--------- WEATHER -------------------------------------//

$('#localWeather').on('pageinit',function() {
  $.simpleWeather({
    zipcode: '46060',
    woeid: '12777567',
    location: '',
    unit: 'f',
    success: function(weather) {
    html = '<h2>'+weather.city+', '+weather.region+'</h2>';
    html += '<p>'+weather.temp+'&deg; '+weather.units.temp+'<br /><span>'+weather.currently+'</span></p>';
    html += '<img style="float:center;" width="135px" src="'+weather.image+'">';
    html += '<a href="'+weather.link+'">View Forecast &raquo;</a>';
    html += '<h3>'+'High' +"  "+ weather.high + '</h3>';
    html += '<h3>'+'Low' +"  "+ weather.low + '</h3>';

  
      $("#weather").html(html);
    },
    error: function(error) {
      $("#weather").html('<p>'+error+'</p>');
    }
  });
});
$('#refresh').on('click', function() {
	location.reload();
});

//--------------------------------------------------------------------------//

//------ MAPS -----//


$('#map').on( "pageinit", function() {
	
    $( "#geoMap iframe" )
        .attr( "width", 620 )
        .attr( "height", 480 );
        
    $( "#geoMap iframe" ).contents().find( "#mapScreen" )
        .css( { "width" : 0, "height" : 0 } );

    $( "#geoMap" ).on({
        popupbeforeposition: function() {
            var size = scale( 480, 320, 0, 1 ),
                w = size.width,
                h = size.height;

            $( "#geoMap iframe" )
                .attr( "width", w )
                .attr( "height", h );
                
            $( "#geoMap iframe" ).contents().find( "#mapScreen" )
                .css( { "width": w, "height" : h } );
                
        },
        popupafterclose: function() {
            $( "#geoMap iframe" )
                .attr( "width", 0 )
                .attr( "height", 0 );

            $( "#geoMap iframe" ).contents().find( "#mapScreen" )
                .css( { "width": 0, "height" : 0 } );
                location.reload();
        }
    });
});

//------------------------------------------------------------------//


// ----   CAPTURE ---------//

 // Called when capture operation is finished
    //
    var captureSuccess = function(mediaFiles) {
        var i, len;
        for (i = 0, len = mediaFiles.length; i < len; i += 1) {
            uploadFile(mediaFiles[i]);
        }       
    };

    // Called if something bad happens.
    // 
    var captureError = function(error) {
        var msg = 'An error occurred during capture: ' + error.code;
        navigator.notification.alert(msg, null, 'Uh oh!');
    };

    // A button will call this function
    //
    var captureImage = function() {
        // Launch device camera application, 
        // allowing user to capture up to 2 images
        navigator.device.capture.captureImage(captureSuccess, captureError, {limit: 2});
    };

    // Upload files to server
    var uploadFile = function (mediaFile) {
        var ft = new FileTransfer(),
            path = mediaFile.fullPath,
            name = mediaFile.name;

        ft.upload(path,
            "http://my.domain.com/upload.php",
            function(result) {
                console.log('Upload success: ' + result.responseCode);
                console.log(result.bytesSent + ' bytes sent');
            },
            function(error) {
                console.log('Error uploading file ' + path + ': ' + error.code);
            },
            { fileName: name });   
    };
 //-------------------------------------------------------//
 
    // #### Geolocation #### //
$('#geo').on('pageinit', function(){


    // Wait for Cordova to load
    //
    document.addEventListener("deviceready", onDeviceReady2, false);

    // Cordova is ready
    //
    function onDeviceReady2() {
        navigator.geolocation.getCurrentPosition(onSuccess, onError);
    };

    // onSuccess Geolocation
    //
    var onSuccess = function(position) {
        var element = document.getElementById('geolocation');
        element.innerHTML = 'Latitude: '           + position.coords.latitude              + '<br />' +
                            'Longitude: '          + position.coords.longitude             + '<br />' +
                            'Altitude: '           + position.coords.altitude              + '<br />' +
                            'Accuracy: '           + position.coords.accuracy              + '<br />' +
                            'Altitude Accuracy: '  + position.coords.altitudeAccuracy      + '<br />' +
                            'Heading: '            + position.coords.heading               + '<br />' +
                            'Speed: '              + position.coords.speed                 + '<br />' +
                            'Timestamp: '          + position.timestamp                    + '<br />';
    };

    // onError Callback receives a PositionError object
    //
    var onError = function(error) {
        alert('code: '    + error.code    + '\n' +
                'message: ' + error.message + '\n');
    };
});
    
//------------------------------------------------------------------------------------------------------//       

//------------ Device ----------------------------------------------------// 

$('#device').on( "pageinit", function() {
var phoneName = window.device.name;
var string = device.model;
var name = device.name;
var deviceID = device.uuid;
 // Wait for Cordova to load
    //
    document.addEventListener("deviceready", onDeviceReady3, false);

    // Cordova is ready
    //
	
    
    function onDeviceReady3() {
        var element = document.getElementById('deviceProperties');
	
        element.innerHTML = 'Device Name: '     + device.name     + '<br />' + 
                            'Device Cordova: '  + device.cordova + '<br />' + 
                            'Device Platform: ' + device.platform + '<br />' + 
                            'Device UUID: '     + device.uuid     + '<br />' + 
                            'Device Model: '    + device.model     + '<br />' + 
                            'Device Version: '  + device.version  + '<br />';
	};
});
//------------------------------------------------------------------------------//

//------------ Connection ----------------------------------------------------//
$('#home').on('pageinit', function(){
// Wait for Cordova to load
    // 
    document.addEventListener("deviceready", onDeviceReady4, false);

    // Cordova is loaded and it is now safe to make calls Cordova methods
    //
    function onDeviceReady4(){
        checkConnection();
    };

    var checkConnection = function(){
        var networkState = navigator.connection.type;

        var states = {};
        states[Connection.UNKNOWN]  = 'Unknown connection';
        states[Connection.WIFI]     = 'You are connected to WiFi';
	states[Connection.CELL_3G]  = 'Cell 3G connection';
        states[Connection.CELL_4G]  = 'Cell 4G connection';
        states[Connection.CELL]     = 'Cell generic connection';
        states[Connection.NONE]     = 'No network connection';

        alert(states[networkState]);
    };
});

//------------------------------------------------------------------------------------------------------//

//---------- YOUTUBE -----------------------//

var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      var onYouTubeIframeAPIReady = function() {
        player = new YT.Player('player', {
          height: '800',
          width: '480',
	  // ### INSERT YOUTUBE VIDEO ID BELOW ### //
          videoId: '5Fp2D9_wd84',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      };

      // 4. The API will call this function when the video player is ready.
      var onPlayerReady = function(event) {
        event.target.playVideo();
      };

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      var done = false;
      var onPlayerStateChange = function(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 0);
          done = true;
        }
      };
      var stopVideo = function() {
	  player.stopVideo();
      };