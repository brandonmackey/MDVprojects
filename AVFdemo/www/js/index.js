/*$('#home').on('pageinit', function(){
});

    // ------  Twitter DATA  -------//
var getData = function() {
	$.getJSON('http://search.twitter.com/search.json?q=samsung&galaxy=15include_entities=result_type=true&callback=?',
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
    //------ MAPS / GEOLOCATION -----//


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
    function onPhotoDataSuccess(imageData) {
      // Uncomment to view the base64 encoded image data
       console.log(imageData);

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
    }

    // Called when a photo is successfully retrieved
    //
    function onPhotoURISuccess(imageURI) {
      // Uncomment to view the image file URI 
       console.log(imageURI);

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
    }

    // A button will call this function
    //
    function capturePhoto() {
      // Take picture using device camera and retrieve image as base64-encoded string
      navigator.camera.getPicture(onPhotoDataSuccess, onFail, { quality: 49,
        destinationType: destinationType.DATA_URL });
    }

    // A button will call this function
    //
    function capturePhotoEdit() {
      // Take picture using device camera, allow edit, and retrieve image as base64-encoded string  
      navigator.camera.getPicture(onPhotoDataSuccess, onFail, { quality: 20, allowEdit: true,
        destinationType: destinationType.DATA_URL });
    }

    // A button will call this function
    //
    function getPhoto(source) {
      // Retrieve image file location from specified source
      navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality: 49, 
        destinationType: destinationType.FILE_URI,
        sourceType: source });
    };

    // Called if something bad happens.
    // 
    function onFail(message) {
      alert('Failed because: ' + message);
    };*/