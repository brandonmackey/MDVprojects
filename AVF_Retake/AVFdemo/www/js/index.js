// iOS //
$('#home').on('pageinit', function(){
	
});

$('#twitter').on('pageinit', function(){
	
	$('#getData').on('click', function() {
		getData();    
	});
});

$('#device').on('click', function(){

});

$('#geo').on('click', function(){

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

//------ MAPS -----//


$( document ).on( "pageinit", function() {
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

    //------ CAMERA  -----//
    
    var pictureSource;   // picture source
    var destinationType; // sets the format of returned value 

    // Wait for Cordova to connect with the device
    //
    document.addEventListener("deviceready",onDeviceReady,false);

    // Cordova is ready to be used!
    //
    function onDeviceReady() {
        pictureSource=navigator.camera.PictureSourceType;
        destinationType=navigator.camera.DestinationType;
    }

    // Called when a photo is successfully retrieved
    //
    var photoBase = function(imageData) {
      // Uncomment to view the base64 encoded image data
      // console.log(imageData);

      // Get image handle
      //
      var smallImage = document.getElementById('smallImage');

      // Unhide image elements
      //
      smallImage.style.display = 'block';

      // Show the captured photo
      // The inline CSS rules are used to resize the image
      //
      smallImage.src = "data:image/jpeg;base64," + imageData;
    };

    // Called when a photo is successfully retrieved
    //
    var photoImage = function(imageURI) {
      // Uncomment to view the image file URI 
      // console.log(imageURI);

      // Get image handle
      //
      var largeImage = document.getElementById('largeImage');

      // Unhide image elements
      //
      largeImage.style.display = 'block';

      // Show the captured photo
      // The inline CSS rules are used to resize the image
      //
      largeImage.src = imageURI;
    };

    // A button will call this function
    //
    var takePicture = function() {
      // Take picture using device camera and retrieve image as base64-encoded string
      navigator.camera.getPicture(photoBase, failMsg, { quality: 50,
        destinationType: destinationType.DATA_URL });
    };

    // A button will call this function
    //
    var takePictureEdit = function() {
      // Take picture using device camera, allow edit, and retrieve image as base64-encoded string  
      navigator.camera.getPicture(photoBase, failMsg, { quality: 20, allowEdit: true,
        destinationType: destinationType.DATA_URL });
    };

    // A button will call this function
    //
    var retrievePicture = function(source) {
      // Retrieve image file location from specified source
      navigator.camera.getPicture(photoImage, failMsg, { quality: 50, 
        destinationType: Camera.PictureSourceType.SAVEDPHOTOALBUM,
        sourceType: source });
    };

    // Called if something bad happens.
    // 
    var failMsg = function(message) {
      alert('Failed because: ' + message);
    };
    
///// #### REMOVE FOR ANDROID #### ///////////////////////////////////////////////
    setTimeout(function() { 
    // do your thing here!
    }, 0);
 //-------------------------------------------------------//
 
    // #### Geolocation #### //
    
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
    
//------------------------------------------------------------------------------------------------------//    

//------------ Device ----------------------------------------------------// 


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
//------------------------------------------------------------------------------//   
 
/*---------- YOUTUBE -----------------------//   ## Not using youtube right now ##
var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '390',
          width: '640',
          videoId: 'wvA2dACgbFs',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 0);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      };
*/