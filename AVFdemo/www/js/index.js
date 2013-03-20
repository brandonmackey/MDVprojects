$('#home').on('pageinit', function(){
    var app = {
        // Application Constructor
        initialize: function() {
            this.bindEvents();
        },
        // Bind Event Listeners
        //
        // Bind any events that are required on startup. Common events are:
        // 'load', 'deviceready', 'offline', and 'online'.
        bindEvents: function() {
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        // deviceready Event Handler
        //
        // The scope of 'this' is the event. In order to call the 'receivedEvent'
        // function, we must explicity call 'app.receivedEvent(...);'
        onDeviceReady: function() {
            app.receivedEvent('deviceready');
        },
        // Update DOM on a Received Event
        receivedEvent: function(id) {
            var parentElement = document.getElementById(id);
            var listeningElement = parentElement.querySelector('.listening');
            var receivedElement = parentElement.querySelector('.received');
    
            listeningElement.setAttribute('style', 'display:none;');
            receivedElement.setAttribute('style', 'display:block;');
    
            console.log('Received Event: ' + id);
        }
    };
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