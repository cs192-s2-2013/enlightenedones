var userId = "1234";
var myPlacesToggle = false;
var myPlacesList = [];
var map;
var marker;
var markerArray =[];
var routesMarkerArray = [];
var routeDistances = [];
var mindist = 999999;
var minpath;
var ikotdistance;



var ridePath;
var walkPath;
var rideMarkers = [];
var walkMarkers = [];

var wayptsnum = 0;


var ridePath;
var walkPath;
var rideMarkers = [];
var walkMarkers = [];
var availablePlaceNames = [];

var infoWindow = new google.maps.InfoWindow({
	maxwidth: 500
}
);
var zoomFluid;
var lineSymbol = {
	    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
	  };

var upIkotRoutePath;
var upTokiRoutePath;
var upKatipRoutePath;
var upPhilcRoutePath;
var visiblePath = [0,0,0,0,0];

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

var display = 0;

var upMapBoundaryCoordinates = [
  	                           	new google.maps.LatLng(14.662367,121.044873),
  	                          	new google.maps.LatLng(14.661994,121.046836),  	    	                          
  	                         	new google.maps.LatLng(14.662149,121.047319),
  	                         	new google.maps.LatLng(14.662108,121.049979),
  	                         	new google.maps.LatLng(14.662118,121.051406),
  	                         	new google.maps.LatLng(14.661983,121.053359),
  	                       		new google.maps.LatLng(14.662004,121.054872),
  	                       		new google.maps.LatLng(14.661942,121.057125),
  	                       		new google.maps.LatLng(14.661921,121.058273),
  	                       		new google.maps.LatLng(14.661879,121.059303),
  	                       		new google.maps.LatLng(14.66189,121.060107),
	                       		new google.maps.LatLng(14.661765,121.062167),
	                       		new google.maps.LatLng(14.661827,121.064796),
	                       		new google.maps.LatLng(14.662066,121.066985),
  	                          	new google.maps.LatLng(14.663,121.072424),
	                       		new google.maps.LatLng(14.663177,121.074066),
	                       		new google.maps.LatLng(14.662025,121.07501),
	                       		new google.maps.LatLng(14.65972,121.076083),
	                       		
	                       		new google.maps.LatLng(14.659087,121.076104),
  	                       		new google.maps.LatLng(14.657769,121.074624),
  	                       		new google.maps.LatLng(14.657489,121.074506),
  	                       		new google.maps.LatLng(14.654448,121.074504),
	                       		new google.maps.LatLng(14.653576,121.07444),
	                       		new google.maps.LatLng(14.652517,121.074375),
	                       		new google.maps.LatLng(14.652543,121.076851),
  	                          	new google.maps.LatLng(14.652138,121.076389),
	                       		new google.maps.LatLng(14.652024,121.076373),
	                       		new google.maps.LatLng(14.650809,121.076507),
	                       		new google.maps.LatLng(14.650296,121.077285),
	                       		new google.maps.LatLng(14.647654,121.074646),
  	                           	
	                       		new google.maps.LatLng(14.647597,121.07443),
	                       		new google.maps.LatLng(14.64631,121.074452),
	                       		new google.maps.LatLng(14.646216,121.073969),
	                       		new google.maps.LatLng(14.636822,121.064094),
	                       		new google.maps.LatLng(14.636697,121.062682),
	                       		new google.maps.LatLng(14.646787,121.061331),//B.Baluyot
	                       		
  	                          	new google.maps.LatLng(14.646777,121.059528),
	                       		new google.maps.LatLng(14.652039,121.056996),
	                       		new google.maps.LatLng(14.651925,121.056824),
	                       		new google.maps.LatLng(14.651759,121.055805),
	                       		new google.maps.LatLng(14.651842,121.05382),
	                       		new google.maps.LatLng(14.653399,121.052887),
	                       		new google.maps.LatLng(14.653835,121.052436),
	                          	new google.maps.LatLng(14.654406,121.052383),
	                       		new google.maps.LatLng(14.654666,121.051321),
	                       		new google.maps.LatLng(14.655797,121.05043),
	                       		new google.maps.LatLng(14.656285,121.049486),
	                       		new google.maps.LatLng(14.656804,121.048831),
	                       		
	                       		new google.maps.LatLng(14.658163,121.047769),
	                       		new google.maps.LatLng(14.658215,121.047608),
	                       		new google.maps.LatLng(14.658548,121.04734),
	                       		new google.maps.LatLng(14.658693,121.046772),
	                       		new google.maps.LatLng(14.659575,121.046407),
	                       		new google.maps.LatLng(14.659637,121.045881),
	                       		new google.maps.LatLng(14.65999,121.045924),
	                          	new google.maps.LatLng(14.660219,121.046171),
	                       		new google.maps.LatLng(14.660219, 121.046171),
	                       		new google.maps.LatLng(14.660489,121.046235),
	                       		new google.maps.LatLng(14.661215,121.045827),
	                       		new google.maps.LatLng(14.661184,121.045591),
	                       		
	                       		new google.maps.LatLng(14.660956,121.045355),
	                       		new google.maps.LatLng(14.661454,121.044604),
	                       		new google.maps.LatLng(14.662367,121.044873)
	                       		
	                       		
  	                         
  	                          
  	                         ];

var upIkotRouteCoordinates = [	
								new google.maps.LatLng(14.65765,121.062345), //magsaysay ave emilio jacinto st corner
								new google.maps.LatLng(14.654837,121.06234), //u ave.
								new google.maps.LatLng(14.647285,121.062294), //cp garcia
								new google.maps.LatLng(14.647659,121.064034),
								new google.maps.LatLng(14.64768,121.064313),
								new google.maps.LatLng(14.647742,121.065096),
								new google.maps.LatLng(14.647804,121.065407),
								new google.maps.LatLng(14.647908,121.065686),
								new google.maps.LatLng(14.64795,121.066255),
								new google.maps.LatLng(14.647192,121.067821),
								new google.maps.LatLng(14.647161,121.068122),
								new google.maps.LatLng(14.647161,121.068969),
								new google.maps.LatLng(14.648801,121.068991), //engg lib 2
								new google.maps.LatLng(14.648874,121.06897),
								new google.maps.LatLng(14.649668,121.068681),
								new google.maps.LatLng(14.650181,121.068487),
								new google.maps.LatLng(14.65097,121.068418),
								new google.maps.LatLng(14.651692,121.068557),
								new google.maps.LatLng(14.652439,121.068659),
								new google.maps.LatLng(14.652444,121.070682), //Fernandez St.
								new google.maps.LatLng(14.652473,121.071672),
								new google.maps.LatLng(14.653871,121.071648), //Roxas Ave.
								new google.maps.LatLng(14.653897,121.072761),
								new google.maps.LatLng(14.654191,121.072922),
								new google.maps.LatLng(14.654383,121.073005),
								new google.maps.LatLng(14.654663,121.07308),//ikot jeepney stop
								new google.maps.LatLng(14.655405,121.073099),
								new google.maps.LatLng(14.655662,121.073029),
								new google.maps.LatLng(14.655883,121.072919),
								new google.maps.LatLng(14.655979,121.072849),
								new google.maps.LatLng(14.656082,121.072734),
								new google.maps.LatLng(14.657081,121.072734), //Romulo Hall
								new google.maps.LatLng(14.657507,121.072734),
								new google.maps.LatLng(14.658599,121.072734),
								new google.maps.LatLng(14.658851,121.072726),
								new google.maps.LatLng(14.659087,121.072723),
								new google.maps.LatLng(14.659259,121.072651),
								new google.maps.LatLng(14.659329,121.072581),
								new google.maps.LatLng(14.659383,121.072468),
								
								new google.maps.LatLng(14.659386,121.072254),
								new google.maps.LatLng(14.65938,121.071605), //F. Agoncillo St.
								new google.maps.LatLng(14.65938,121.0705), //Shopping Center
								new google.maps.LatLng(14.659373,121.069993),
								new google.maps.LatLng(14.659362,121.069563),
								new google.maps.LatLng(14.659357,121.069212), //Romulo Hall
								new google.maps.LatLng(14.659349,121.068949),
								new google.maps.LatLng(14.659344,121.06855),
								new google.maps.LatLng(14.657484,121.068555), //Magsaysay Ave
								new google.maps.LatLng(14.657489,121.067678),
								new google.maps.LatLng(14.657502,121.066943),
								new google.maps.LatLng(14.657523,121.065749),
								new google.maps.LatLng(14.657525,121.065543),
								new google.maps.LatLng(14.65753,121.064813),
								new google.maps.LatLng(14.657608,121.063826),
								new google.maps.LatLng(14.657632,121.06282), 
								new google.maps.LatLng(14.657639,121.062482),
								new google.maps.LatLng(14.65765,121.062345)
                            
                            ];


var upTokiRouteCoordinates = [	
								new google.maps.LatLng(14.653742, 121.064903), 
								new google.maps.LatLng(14.653846,121.068579), //a. roces
								new google.maps.LatLng(14.657468,121.068536),
								new google.maps.LatLng(14.659373,121.068525), //sc
								new google.maps.LatLng(14.659388, 121.072424),
								new google.maps.LatLng(14.659233, 121.072692), //ilangilang
								new google.maps.LatLng(14.656088, 121.072714),									
								new google.maps.LatLng(14.656056, 121.068594),
								
								new google.maps.LatLng(14.653825, 121.068658), //circle again
								new google.maps.LatLng(14.653897, 121.072692),
								new google.maps.LatLng(14.653773, 121.072757), //near vinzons curve
								new google.maps.LatLng(14.652237, 121.072810),
								new google.maps.LatLng(14.652039, 121.072778), //curve again
								new google.maps.LatLng(14.651261, 121.071963), 
								new google.maps.LatLng(14.651136, 121.071920), //curve again agian
								new google.maps.LatLng(14.650347, 121.071984), //science circle
								new google.maps.LatLng(14.650493, 121.072639),
								new google.maps.LatLng(14.650534, 121.073615),
								new google.maps.LatLng(14.650462, 121.073744), //curve again
								new google.maps.LatLng(14.648230, 121.073765), //CP Garcia
								new google.maps.LatLng(14.648188, 121.072531), 
								new google.maps.LatLng(14.647597, 121.071383), //used to be path to Math
								new google.maps.LatLng(14.647327, 121.070907),
								new google.maps.LatLng(14.647187, 121.070124),
								new google.maps.LatLng(14.647171, 121.068986),
								new google.maps.LatLng(14.648874, 121.068981), //DCS
								new google.maps.LatLng(14.650223, 121.068471),
								new google.maps.LatLng(14.650436, 121.068429), //MS
								new google.maps.LatLng(14.651095, 121.068418),
								new google.maps.LatLng(14.652003, 121.068627), 
								new google.maps.LatLng(14.652423, 121.068654),
								new google.maps.LatLng(14.652403,121.068321),
								new google.maps.LatLng(14.652252,121.067812),
								new google.maps.LatLng(14.652128,121.067506),
								new google.maps.LatLng(14.651738,121.066959), //OUR
								new google.maps.LatLng(14.651297,121.066749),
								new google.maps.LatLng(14.651183,121.066728),
								
								new google.maps.LatLng(14.650327,121.06683),
								new google.maps.LatLng(14.651733,121.065156),
								new google.maps.LatLng(14.652003,121.065022), 
								new google.maps.LatLng(14.652932,121.065172), 
								new google.maps.LatLng(14.652896,121.06234), 

								new google.maps.LatLng(14.657634,121.062356),
								new google.maps.LatLng(14.657608,121.063757), //SURP
								new google.maps.LatLng(14.657525,121.064811),
								new google.maps.LatLng(14.655914,121.064789), //Circle
								new google.maps.LatLng(14.654894,121.064277), 
								new google.maps.LatLng(14.654811,121.064282),
								new google.maps.LatLng(14.653799,121.064795),
								new google.maps.LatLng(14.653742, 121.064903)
                            
                            ];

var upKatipRouteCoordinates = [	
								new google.maps.LatLng(14.657525,121.072742), //GT
								new google.maps.LatLng(14.659144,121.072736), 
								new google.maps.LatLng(14.659393,121.072468),
								new google.maps.LatLng(14.659362,121.068547), 
								new google.maps.LatLng(14.657494,121.068547), //Engg
								new google.maps.LatLng(14.657546,121.064818), 
								
								new google.maps.LatLng(14.655911,121.064791), //Circle								
								new google.maps.LatLng(14.654961,121.064287),
								new google.maps.LatLng(14.654832,121.064276), 
								new google.maps.LatLng(14.65382,121.064775),
								new google.maps.LatLng(14.6537,121.064888), 
								new google.maps.LatLng(14.653804,121.068594), //AS
								new google.maps.LatLng(14.653887,121.072735), //Vinsonz
								new google.maps.LatLng(14.654349,121.072988), 
								new google.maps.LatLng(14.654858,121.073096), 
								new google.maps.LatLng(14.655408,121.073096),
								new google.maps.LatLng(14.655885,121.072919),
								new google.maps.LatLng(14.656103,121.072715),
								new google.maps.LatLng(14.657478,121.072736), //GT again
								
								new google.maps.LatLng(14.657489,121.074163), //Katip
								new google.maps.LatLng(14.653565,121.074216), 
								new google.maps.LatLng(14.648303,121.074237), //CPG
								new google.maps.LatLng(14.64631,121.074246),
								new google.maps.LatLng(14.643694,121.074547), 
								new google.maps.LatLng(14.636843,121.074225), //Arr-neo
								new google.maps.LatLng(14.632005,121.074032), //Jeep Stop
								
								new google.maps.LatLng(14.632218,121.074351),
								new google.maps.LatLng(14.634694,121.074474),
								new google.maps.LatLng(14.634808,121.074437),
								new google.maps.LatLng(14.641223,121.074683), //Arr-neo2
								new google.maps.LatLng(14.643299,121.074801),
								new google.maps.LatLng(14.646611,121.074431), 
								new google.maps.LatLng(14.649559,121.074474),
								new google.maps.LatLng(14.653534,121.074474), //Shister
								new google.maps.LatLng(14.654624,121.074527),
								new google.maps.LatLng(14.65751,121.074522),
								new google.maps.LatLng(14.657541,121.074469),
								new google.maps.LatLng(14.657525,121.072742)
                             
                             ];

var upPhilcRouteCoordinates = [	
								new google.maps.LatLng(14.657525,121.072742), //GT
								new google.maps.LatLng(14.659144,121.072736), 
								new google.maps.LatLng(14.659393,121.072468),
								new google.maps.LatLng(14.659362,121.068547), 
								new google.maps.LatLng(14.657494,121.068547), //Engg
								new google.maps.LatLng(14.656067,121.068562),
								new google.maps.LatLng(14.656046,121.065001),
								new google.maps.LatLng(14.655911,121.064791), //Circle								
								new google.maps.LatLng(14.654961,121.064287),
								
								new google.maps.LatLng(14.654946,121.064105), //ENtrance
								new google.maps.LatLng(14.654904,121.062345),
								new google.maps.LatLng(14.654889,121.058397),
								new google.maps.LatLng(14.654858,121.056906),
								new google.maps.LatLng(14.654909,121.055876),
								new google.maps.LatLng(14.655024,121.055704),
								new google.maps.LatLng(14.655143,121.055661),
								new google.maps.LatLng(14.655465,121.055822), //commonwealth
								new google.maps.LatLng(14.656549,121.057517), //uturn
								new google.maps.LatLng(14.656835,121.057292),
								new google.maps.LatLng(14.656207,121.056267),
								new google.maps.LatLng(14.655076,121.054545),
								new google.maps.LatLng(14.65451,121.053762),
								new google.maps.LatLng(14.653965,121.053177),
								
								new google.maps.LatLng(14.652808,121.05138), //uturn again
								new google.maps.LatLng(14.652615,121.051544),
								new google.maps.LatLng(14.653,121.052092),
								new google.maps.LatLng(14.653433,121.052802),
								new google.maps.LatLng(14.654035,121.053961),
								new google.maps.LatLng(14.654193,121.054382),
								new google.maps.LatLng(14.654642,121.056461),
								new google.maps.LatLng(14.654694,121.05693),
								new google.maps.LatLng(14.654767,121.062332), //gate
								new google.maps.LatLng(14.65479,121.064062),
								
								new google.maps.LatLng(14.654746,121.064304), //oble
								new google.maps.LatLng(14.65382,121.064775),
								new google.maps.LatLng(14.6537,121.064888), 
								new google.maps.LatLng(14.653804,121.068594), //AS
								new google.maps.LatLng(14.653887,121.072735), //Vinsonz
								new google.maps.LatLng(14.654349,121.072988), 
								new google.maps.LatLng(14.654858,121.073096), 
								new google.maps.LatLng(14.655408,121.073096),
								new google.maps.LatLng(14.655885,121.072919),
								new google.maps.LatLng(14.656103,121.072715),
								new google.maps.LatLng(14.657478,121.072736), //GT again
								new google.maps.LatLng(14.657525,121.072742)
                             
                             ];

function initialize() {
	directionsDisplay = new google.maps.DirectionsRenderer();
	var myLatlng = new google.maps.LatLng(14.651147,121.060274); 

  	var mapOptions = {
    		center: myLatlng,
    		zoom: 15,
    		disableDefaultUI: false,
    		clickableLabels:false 
  	};
  	map = new google.maps.Map(document.getElementById("map-canvas"),
      	mapOptions);
  	directionsDisplay.setMap(map);

  	
  	var upMapBoundaryPath = new google.maps.Polyline({
  	                 path: upMapBoundaryCoordinates,
  	                 geodesic: true,
  	                 strokeColor: '#A23030',
  	                 strokeOpacity: 0.55,
  	                 strokeWeight: 3
  	               });

  	upMapBoundaryPath.setMap(map);

	
	upIkotRoutePath = new google.maps.Polyline({
             path: upIkotRouteCoordinates,
             geodesic: true,
             strokeColor: '#fff000',
             strokeOpacity: 0.80,
             strokeWeight: 4,
             icons: [{
                 icon: lineSymbol,
                 offset: '100%'
               }]

           });
	
	upTokiRoutePath = new google.maps.Polyline({
             path: upTokiRouteCoordinates,
             geodesic: true,
             strokeColor: '#7f00ff',
             strokeOpacity: 0.80,
             strokeWeight: 4,
             icons: [{
                 icon: lineSymbol,
                 offset: '100%'
               }]
           });

	
	upKatipRoutePath = new google.maps.Polyline({
             path: upKatipRouteCoordinates,
             geodesic: true,
             strokeColor: '#f00',
             strokeOpacity: 0.80,
             strokeWeight: 4,
             icons: [{
                 icon: lineSymbol,
                 offset: '100%'
               }]
           });

	
	upPhilcRoutePath = new google.maps.Polyline({
             path: upPhilcRouteCoordinates,
             geodesic: true,
             strokeColor: '#0f0',
             strokeOpacity: 0.80,
             strokeWeight: 4,
             icons: [{
                 icon: lineSymbol,
                 offset: '100%'
               }]
           });

	/*----------------------------------------------------
		Object: #goup-logo
		Event: click
		Function: pans the map back to the initial center 
	------------------------------------------------------*/
	google.maps.event.addDomListener(document.getElementById("goup-logo"), 'click', function() {

	 	map.panTo(myLatlng);
	    map.setZoom(15);
	    
	  
	});	
	
	
	}

function addWaypts(val) {
	var num = parseInt(val);
	$("div#waypts").html("");
	wayptscnt = num;
	if(num > 0)
	{
		
	for(var i = 1; i <= num; i++) {
		$("div#waypts").append('<input id="waypoint'+i+'" class="waypoint-input" type="text"/>');
	}
	$("div#waypts").append('<input id="waypointsButton" class="btn btn-primary" type="button" value="Use waypoints" onclick="tsp();" />');
	
	}
	$(document).ready(function() {
		$(".waypoint-input").autocomplete({
			source: availablePlaceNames
		});
	});
}

function tsp() {
	var valid = true;
	var origin = $("#searchOriginPlaceName").val();
	var dest = $("#searchDestinationPlaceName").val();
	var start, end;
	if(origin == "" || dest == "")
		valid = false;
	waypointsArray = $(".waypoint-input");
	var latlngarray = [];
	var placeNames = [origin];
	for(var i = 0; i < waypointsArray.length; i++) {
		if(waypointsArray[i].value == "") {
			valid = false;
			break;
		}
		placeNames.push(waypointsArray[i].value);
		var place = $.parseJSON($.ajax({
			type: "Get",
	        url:  '/UPMap/findPlace',
	        dataType: "json",
	        data: "placeName=" +waypointsArray[i].value,
	        async: false
	    }).responseText);
		var latlngstr = place[0].placeLat+","+place[0].placeLong;
		latlngarray.push({
			location:latlngstr,
			stopover:true
		});
	}
	placeNames.push(dest);
	
	$.ajax({
		type: "Get",
		url: "/UPMap/findPlace",
		data: "placeName=" +origin,
		async: false,
		success: function(json){
			place = $.parseJSON(json);
			start = place[0].placeLat+","+place[0].placeLong;
		},
		error: function(e){
			alert("Error: "+ e);
		}
	});
	$.ajax({
		type: "Get",
		url: "/UPMap/findPlace",
		data: "placeName=" +dest,
		async: false,
		success: function(json){
			place = $.parseJSON(json);
			end = place[0].placeLat+","+place[0].placeLong;
		},
		error: function(e){
			alert("Error: "+ e);
		}
	});
	
	
	if(!valid) {
		clearMarkers();
		$("div#routes").html("");
    	$("div#routelength").html("");
	}
	else {
		var tick = false;
		if($("#optimizeWaypoints").is(":checked"))
			tick = true;
	
		var request = {
			origin:start,
			destination:end,
			travelMode:google.maps.TravelMode.WALKING,
			waypoints: latlngarray,
			optimizeWaypoints: tick
		};

		directionsService.route(request, function(response, status) {
		     if(status == google.maps.DirectionsStatus.OK) {
		    	directionsDisplay.setMap(map);
				directionsDisplay.setDirections(response);
		    	$("div#routes").html("");
		    	$("div#routelength").html("");
		    	var route = response.routes[0];
		    	for(var i = 0; i < route.legs.length; i++) {
		    		$("div#routes").append('Leg '+(i+1)+': '+placeNames[i]+' to '+placeNames[i+1]+': '+route.legs[i].distance.value+' m<br />');
		    	}
		     }
		    
		});
	}
}

function path() {
	var origin = $("#searchOriginPlaceName").val();
	var dest = $("#searchDestinationPlaceName").val();
	if(origin == "" || dest == "") {
		clearMarkers();
		if(visiblePath[0] == 1) ikotRoute();
		directionsDisplay.setMap();
		$("div#routes").html("");
		$("div#routelength").html("");
	}
	else {
		var originLat = "";
		var originLng = "";
		var destLat = "";
		var destLng = "";
		$.ajax({
			type: "Get",
			url: "/UPMap/findPlace",
			data: "placeName=" +origin,
			success: function(json){
				place = $.parseJSON(json);
				originLat = place[0].placeLat;
				originLng = place[0].placeLong;
			},
			error: function(e){
				alert("Error: "+ e);
			}
			
		});
		
		$.ajax({
			type: "Get",
			url: "/UPMap/findPlace",
			data: "placeName=" +dest,
			success: function(json){
				place = $.parseJSON(json);
				destLat = place[0].placeLat;
				destLng = place[0].placeLong;
				calcRoute(originLat, originLng, destLat, destLng);
			},
			error: function(e){
				alert("Error: "+ e);
			}
			
		});
	}
}

//google.maps.geometry.spherical.computeDistanceBetween (latLngA, latLngB);

function projFactor(segLat1, segLng1, segLat2, segLng2, pLat, pLng) {
	var dx = segLng2-segLng1;
	var dy = segLat2-segLat1;
	var len2 = dx*dx + dy*dy;
	var r = ( (pLng-segLng1)*dx + (pLat-segLat1)*dy )/len2;
	return r;
}

function project(r, segLat1, segLng1, segLat2, segLng2, pLat, pLng) {
	var newLng = segLng1+r*(segLng2-segLng1);
	var newLat = segLat1+r*(segLat2-segLat1);
	var p = new google.maps.LatLng(pLat, pLng);
	var c = new google.maps.LatLng(newLat, newLng);
	return [google.maps.geometry.spherical.computeDistanceBetween(p, c), c];
}

function closestPoint(segLat1, segLng1, segLat2, segLng2, pLat, pLng) {
	var r = projFactor(segLat1, segLng1, segLat2, segLng2, pLat, pLng);
	if(r > 0.0 && r < 1.0)
		return project(r, segLat1, segLng1, segLat2, segLng2, pLat, pLng);
	var s1 = new google.maps.LatLng(segLat1, segLng1);
	var s2 = new google.maps.LatLng(segLat2, segLng2);
	var p = new google.maps.LatLng(pLat, pLng);
	var dis1 = google.maps.geometry.spherical.computeDistanceBetween(s1, p);
	var dis2 = google.maps.geometry.spherical.computeDistanceBetween(s2, p);
	if(dis1 < dis2) return [dis1, s1];
	return [dis2, s2];
}

function calcIkot(originLat, originLng, destLat, destLng) {
	var start;
	var end;
	var originLatNum = parseFloat(originLat);
	var originLngNum = parseFloat(originLng);
	var destLatNum = parseFloat(destLat);
	var destLngNum = parseFloat(destLng);
	var originLatLng = new google.maps.LatLng(originLatNum, originLngNum);
	var destLatLng = new google.maps.LatLng(destLatNum, destLngNum);
	ikotdistance = 0.0;
	var i1, i2;

	var mindist1 = null;
	var mindist2 = null;
	for(var i = 0; i < upIkotRouteCoordinates.length; i++) {
		var p1 = upIkotRouteCoordinates[i];
		var p2 = upIkotRouteCoordinates[(i+1)%upIkotRouteCoordinates.length];
		var data = closestPoint(p1.lat(), p1.lng(), p2.lat(), p2.lng(), originLatNum, originLngNum);
		if(mindist1 == null || mindist1 > data[0]) {
			mindist1 = data[0];
			start = data[1];
			i1 = i;
		}
		data = closestPoint(p1.lat(), p1.lng(), p2.lat(), p2.lng(), destLatNum, destLngNum);
		if(mindist2 == null || mindist2 > data[0]) {
			mindist2 = data[0];
			end = data[1];
			i2 = i;
		}
	}
	ikotdistance += google.maps.geometry.spherical.computeDistanceBetween(upIkotRouteCoordinates[i1], start);
	i1=(i1+1)%upIkotRouteCoordinates.length;
	for(var trace = i1; trace != i2; trace=(trace+1)%upIkotRouteCoordinates.length) {
		var p1 = upIkotRouteCoordinates[trace];
		var p2 = upIkotRouteCoordinates[(trace+1)%upIkotRouteCoordinates.length];
		ikotdistance += google.maps.geometry.spherical.computeDistanceBetween(p1,p2);
	}
	ikotdistance += google.maps.geometry.spherical.computeDistanceBetween(upIkotRouteCoordinates[i2], end);
	ikotdistance /= (67.0*1.5);

	var from1 = originLat+","+originLng;
	var to1 = start.lat()+","+start.lng();
	var from2 = end.lat()+","+end.lng();
	var to2 = destLat+","+destLng;
	var request1 = {
		      origin:from1,
		      destination:to1,
		      travelMode:google.maps.TravelMode.WALKING
	};
	var request2 = {
		      origin:from2,
		      destination:to2,
		      travelMode:google.maps.TravelMode.WALKING
	};

	directionsService.route(request1, function(response1, status) {
		var walkdist = 0.0;
	    if (status == google.maps.DirectionsStatus.OK) {
	    	ridePath = response1;
	    	$("div#routelength").html("");
	    	$("div#routes").append('<div class="col-md-12"><a class="routejeep-link1">Walk to Ikot'+'</a></div> ');
	    	for (var i = 0; i < ridePath.routes[0].legs[0].steps.length; i++)
	    		walkdist += ridePath.routes[0].legs[0].steps[i].distance.value;

	    	directionsService.route(request2, function(response2, status) {
			    if (status == google.maps.DirectionsStatus.OK) {
			    	walkPath = response2;
			    	$("div#routelength").html("");
			    	$("div#routes").append('<div class="col-md-12"><a class="routejeep-link2" data-index='+(i-1)+'>Walk from Ikot'+'</a></div> ');
			    	for (var i = 0; i < walkPath.routes[0].legs[0].steps.length; i++)
			    		walkdist += walkPath.routes[0].legs[0].steps[i].distance.value;
			    	ikotdistance += walkdist/67.0;
			    	ikotdistance = ikotdistance.toFixed();
			    	if(ikotdistance <= mindist) {
			    		mindist = ikotdistance;
			    		minpath = "Ikot";
			    	}
			    }

		

			    $(document).ready(function() {
			    	$(".routejeep-link1").click(function() {
		    	    	hideRouteMarkers();

		    	    	$("div#routelength").html("approx: "+ikotdistance+" mins <br />");
		    	    	$("div#routelength").append("Minimum travel time: "+mindist+" mins (Path "+minpath+")<br />");
		    	    	if(directionsDisplay.getMap() == null) directionsDisplay.setMap(map);
		    	    	if(visiblePath[0] == 0) ikotRoute();
		    	    	directionsDisplay.setDirections(ridePath);
		    	    	for (var i = 0; i < ridePath.routes[0].legs[0].steps.length; i++) {
		    	    	    var newMarker = new google.maps.Marker({
		    	    	      position: ridePath.routes[0].legs[0].steps[i].start_location,
		    	    	      map: map
		    	    	    });
		    	    	    attachInstructionText(newMarker, ridePath.routes[0].legs[0].steps.steps[i].instructions);
		    	    	    rideMarkers[i] = newMarker;
		    	    	    newMarker = null;
		    	    	 }
		    	    });
	
		    	
		    	    $(".routejeep-link2").click(function() {
		    	    	hideRouteMarkers();

		    	    	$("div#routelength").html("approx: "+ikotdistance+" mins");
		    	    	$("div#routelength").append("Minimum travel time: "+mindist+" mins (Path "+minpath+")<br />");
		    	    	if(directionsDisplay.getMap() == null) directionsDisplay.setMap(map);
		    	    	if(visiblePath[0] == 0) ikotRoute();
		    	    	directionsDisplay.setDirections(walkPath);
		    	    	for (var i = 0; i < walkPath.routes[0].legs[0].steps.length; i++) {
		    	    	    var newMarker = new google.maps.Marker({
		    	    	      position: walkPath.routes[0].legs[0].steps[i].start_location,
		    	    	      map: map
		    	    	    });
		    	    	    attachInstructionText(newMarker, walkPath.routes[0].legs[0].steps.steps[i].instructions);
		    	    	    walkMarkers[i] = newMarker;
		    	    	    newMarker = null;
		    	    	 }
		    	    });
		    	});
		    });
	    }
	  });
}

function calcRoute(originLat, originLng, destLat, destLng) {
	var originLatLngStr = originLat+","+originLng;
	var destinationLatLngStr = destLat+","+destLng;
		
	  clearMarkers();
	  mindist = 999999;

	  var request = {
	      origin:originLatLngStr,
	      destination:destinationLatLngStr,
	      travelMode:google.maps.TravelMode.WALKING,
	      provideRouteAlternatives:true
	  };
	  directionsService.route(request, function(response, status) {
		  if (status == google.maps.DirectionsStatus.OK) {
	    	$("div#routes").html("");
	    	$("div#routelength").html("");
    	 for(var i = 1; i <= response.routes.length; i++) {
    		 routesMarkerArray[i-1] = [];
	    	  $("div#routes").append('<div class="col-md-12"><a class="route-link" data-index='+(i-1)+'>'+i+'</a></div> ');
	      }
	      directionsDisplay.setMap(map);
	      directionsDisplay.setDirections(response);
	      routeDistances = [];
	      for(var i = 0; i < response.routes.length; i++) {
	    	  var dist = 0;
	    	  for(var j = 0; j < response.routes[i].legs[0].steps.length; j++) {
	    		  dist += response.routes[i].legs[0].steps[j].distance.value;
	    	  }
	    	  dist /= 67.0;
	    	  dist = dist.toFixed();
	    	  routeDistances[i] = dist;
	    	  if(routeDistances[i] < mindist) { mindist = routeDistances[i]; minpath = i+1; }
	      }
	      drawRoutesMarkers(response, 0);
	    }

	    $(document).ready(function() {
    	    $(".route-link").click(function() {
    	    	var index = $(this).data("index");
    	    	clearMarkers();
    	    	$("div#routelength").html("");
    	    	if(directionsDisplay.getMap() == null) directionsDisplay.setMap(map);
    	    	if(visiblePath[0] == 1) ikotRoute();
    	    	directionsDisplay.setDirections(response);
    	    	directionsDisplay.setRouteIndex(index);
    	    	drawRoutesMarkers(response, index);
    	    });
    	});

	    calcIkot(originLat, originLng, destLat, destLng);
	  });
}

function drawRoutesMarkers(directionResult, ind) {
	var myRoute = directionResult.routes[ind].legs[0];
	  for (var i = 0; i < myRoute.steps.length; i++) {
	    var newMarker = new google.maps.Marker({
	      position: myRoute.steps[i].start_location,
	      map: map
	    });
	    attachInstructionText(newMarker, myRoute.steps[i].instructions);
	    routesMarkerArray[ind][i] = newMarker;
	    newMarker = null;
	  }
	  $("div#routelength").html("approx "+routeDistances[ind]+" mins <br />");
	  $("div#routelength").append("Minimum travel time: "+mindist+" mins (Path "+minpath+")<br />");
}

function attachInstructionText(marker, text) {
	  google.maps.event.addListener(marker, 'click', function() {
	    stepDisplay.setContent(text);
	    stepDisplay.open(map, marker);
	  });
}

function clearMarkers(){
	for(var i=0;i<markerArray.length;i++){
		markerArray[i].setMap(null);
	}
	markerArray = [];

	for(var i = 0; i < routesMarkerArray.length; i++) {
		for(var j = 0; j < routesMarkerArray[i].length; j++) {
			routesMarkerArray[i][j].setMap(null);
		}
	}
	routesMarkerArray = [];
	for(var i = 0; i < rideMarkers.length; i++) {
		rideMarkers[i].setMap(null);
	}
	for(var i = 0; i < walkMarkers.length; i++) {
		walkMarkers[i].setMap(null);
	}
	rideMarkers = [];
	walkMarkers = [];


}

function hideRouteMarkers(){
	for(var i = 0; i < routesMarkerArray.length; i++) {
		for(var j = 0; j < routesMarkerArray[i].length; j++) {
			routesMarkerArray[i][j].setMap(null);
		}
	}
	for(var i = 0; i < rideMarkers.length; i++) {
		rideMarkers[i].setMap(null);
	}
	for(var i = 0; i < walkMarkers.length; i++) {
		walkMarkers[i].setMap(null);
	}
}

function setInitPanAndZoom(){
	
	var myLatlng = new google.maps.LatLng(14.651147,121.060274); 
	map.panTo(myLatlng);
	zoomFluid = map.getZoom();
	zoomOut();
}
function ikotRoute (){
	
	if(visiblePath[0]==0){
		
		upIkotRoutePath.setMap(map);
		visiblePath[0]=1;
		
	}else{
		upIkotRoutePath.setMap(null);
		visiblePath[0]=0;
		visiblePath[4]=0;
	}
		

}

function tokiRoute (){
	if(visiblePath[1]==0){
		upTokiRoutePath.setMap(map);
		visiblePath[1]=1;
		
	}else{
		upTokiRoutePath.setMap(null);
		visiblePath[1]=0;
		visiblePath[4]=0;
	}
}

function katipRoute (){
	if(visiblePath[2]==0){
		upKatipRoutePath.setMap(map);
		visiblePath[2]=1;
		
	}else{
		upKatipRoutePath.setMap(null);
		visiblePath[2]=0;
		visiblePath[4]=0;
	}
}
function philcRoute (){
	if(visiblePath[3]==0){
		upPhilcRoutePath.setMap(map);
		visiblePath[3]=1;
		
	}else{
		upPhilcRoutePath.setMap(null);
		visiblePath[3]=0;
		visiblePath[4]=0;
	}
}

function allRoute (){
	
	if(visiblePath[4]==0){
		upIkotRoutePath.setMap(map);
		upTokiRoutePath.setMap(map);
		upKatipRoutePath.setMap(map);
		upPhilcRoutePath.setMap(map);
		var i = 0;
		while(i<5){
			visiblePath[i] = 1;
			i++;
		}
	}else{
		upIkotRoutePath.setMap(null);
		upTokiRoutePath.setMap(null);
		upKatipRoutePath.setMap(null);
		upPhilcRoutePath.setMap(null);
		var i = 0;
		while(i<5){
			visiblePath[i] = 0;
			i++;
		}
	}
	
}

function panToLatLng(placeName,placeLat,placeLong){
	var myLatLng = new google.maps.LatLng(placeLat,placeLong);

	
	zoomFluid = map.getZoom();
	map.panTo(myLatLng);
	
	if(zoomFluid<=17)
		zoomTo();
	else
		zoomOut();
	
	
	
}

var autoCompleteCategory = "";
function getAllPlaceNames(){
	$.ajax({
		type: "Get",
		url: "/UPMap/findPlaceByCategoryAndName",
		data: "category=" + autoCompleteCategory +"&placeName=" +"",
		success: function(json){
		
			if(json){
				var place = $.parseJSON(json);
				if(place) {
				
					
					for(var i = 0; i < place.length; i++) {
						availablePlaceNames.push(place[i].placeName);
					}
				}
			}
			
						
		},
		error: function(e){
			alert("Error: "+ e);
		}
		
	});
	
	$( "#searchPlaceName" ).autocomplete({
		source: availablePlaceNames
	});
	
	$( ".search-input" ).autocomplete({
		source: availablePlaceNames
	});
}



function containsObject(obj,array){
	
	for(var i=0;i<array.length;i++){
		if(_.isEqual(array[i],obj))
			return true;
	}
	return false;
}

function getMyPlaces(){
	
	$.ajax({
		type: "Get",
		url: "/UPMap/getMyPlaces",
		data: "userId="+userId,
		success: function(json){
			myPlacesList = $.parseJSON(json);
			updateMyPlaces();
			
		},
		error: function(e){
			return null;
		}
	});
	
}

function updateMyPlaces(){
	
	
	
	$("div#favorites").html("");
	if(myPlacesList!=""){
		for(var i=0;i<myPlacesList.length;i++){
			$("div#favorites").append('<div><a class="favorite-link">'+myPlacesList[i].placeName+'</a></div>');
			
		}
		
		$("a.favorite-link").click(function(){
			var placename = $(this).html();
			var category = "";
			doSearchOptimized(category, placename)
		});
		
	}else{
		
		$("div#favorites").append("<p>No saved places yet.</p>");
	}

}

function showOrHideFeature(){
	if(display==0){
		$("#welcome").fadeIn(250);
	}else{
		$("#welcome").hide();
	}
}	

function viewMyPlaces(){
	
	
	
	
	if($("#myPlaces").css("display")=="none"){
		getMyPlaces();
		updateMyPlaces();
		updateRecentlySearched();
		hideAll();
		$("#myPlaces").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
	}
	
		
	
}

function hideMyPlaces(){
	
	if($("#myPlaces").css("display")!="none"){
		$("#myPlaces").hide();
		display = display -1;
		showOrHideFeature();
	}
		
	
}

function viewGetDirections(){
	
	
	if($("#getDirections").css("display")=="none"){
		
		hideAll();
		$("#getDirections").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
	}
	
	
}

function hideGetDirections(){
	if($("#getDirections").css("display")!="none"){
		$("#getDirections").hide();
		display = display - 1;
		showOrHideFeature();
		clearMarkers();
		directionsDisplay.setMap();
	}
}

function showJeepneyRoutes(){
	
	
	if($("#jeepneyRoutes").css("display")=="none"){
		hideAll();
		$("#jeepneyRoutes").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
	}
	

}

function hideJeepneyRoutes(){
	
	if($("#jeepneyRoutes").css("display")!="none"){
		$("#jeepneyRoutes").hide();
		visiblePath[4] = 1;
		allRoute();
		display = display - 1;
		showOrHideFeature();
	}
}

function showHelp(){
	$('#joyRideTipContent').joyride({
        autoStart : true,
        postStepCallback : function (index, tip) {
        if (index == 2) {
          $(this).joyride('set_li', false, 1);
        }
      },
      modal:true,
      expose: true
      });
}

function showSettings(){
	
	
	if($("#settings").css("display")=="none"){
		hideAll();
		$("#settings").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
	}
	

}


function showTrivia(){
	
	
	if($("#trivia").css("display")=="none"){
		
		hideAll();
		$("#trivia").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
		
	}
	

}

function hideTrivia(){
	
	if($("#trivia").css("display")!="none"){
		$("#trivia").hide();
		display = diplay - 1;
		showOrHideFeature();
	}
}

function hideSettings(){
	
	if($("#settings").css("display")!="none"){
		$("#settings").hide();
		display = diplay - 1;
		showOrHideFeature();
	}
}

function showWeather(){
	
	
	if($("#weather").css("display")=="none"){
		hideAll();
		
	 	$(document).ready(function() {
  		  $.simpleWeather({
  		    location: 'UP Diliman',
  		    woeid: '',
  		    unit: 'c',
  		    success: function(weather) {
  		      html = '<div class="weather-icon"><i class="icon-'+weather.code+'"></i></div><div class="weather-temp"> '+weather.temp+'&deg;'+weather.units.temp+'</div>';
  		      html += '<ul><li>'+weather.city+'</li>';
  		      html += '<li class="currently">'+weather.currently+'</li>';
  		      
  		  
  		      $("#weather").html(html);
  		    },
  		    error: function(error) {
  		      $("#weather").html('<p>'+error+'</p>');
  		    }
  		  });
  		});

		
		$("#weather").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
	}
	

}


function hideWeather(){
	
	if($("#weather").css("display")!="none"){
		$("#weather").hide();
		display = display - 1;
		showOrHideFeature();
	}
}

function hideAll(){
	hideMyPlaces();
	hideGetDirections();
	hideJeepneyRoutes();
	hideWeather();
	hideTrivia();
	hideSettings();
	hideResults();
	
}

function showResults(){
	hideAll();
	if($("#results").css("display")=="none"){
		
		clearResults();
		$("#results").fadeIn(250);
		display = display + 1;
		showOrHideFeature();
	}
}

function hideResults(){
	
	if($("#results").css("display")!="none"){
		clearResults();
		$("#results").hide();
		display = display - 1;
		showOrHideFeature();
	}
}

function clearResults(){
	$("#results").html("");
	clearMarkers();
}


function updateRecentlySearched(){
	
	$("div#recent").html("");
	
	var searchedList = $.cookie("recentlySearched");
	
	if(searchedList){
		searchedList = $.parseJSON(searchedList);
		
		if(searchedList.length == 0){
			
			$("div#recent").append("No recently searched items.");
		}else{
			
			for(var i=0; i<searchedList.length;i++){
			 
				$("div#recent").append('<div class="recent-place"><a class="recent-place-link" data-placename="'+ searchedList[i].placeName+ '">'+searchedList[i].placeName+'</a></div>');
				
				$(".recent-place-link").click(function(){
					var category ="";
					var placeName = $(this).data("placename");
					doSearchOptimized(category,placeName);
				});
				
				$(".recent-place").hover(function(){
					$(this).find(".delete-mark").css("visibility","visible");
					$(this).find(".recent-place-link").addClass("recent-place-focus");
				},function(){
					$(this).find(".delete-mark").css("visibility","hidden");
					$(this).find(".recent-place-link").removeClass("recent-place-focus");
				});
			}
			
			
		}
		
		
		
	}else{
		$("div#recent").append("No recently searched items.");
	}
	
	
	
}

function addRecentlySearchedPlace(object){
	
	
	var searchedList = $.cookie("recentlySearched");
	var objectJSON;
	
	if(!searchedList){
		searchedList = [];
		searchedList.unshift(object);
		objectJSON = JSON.stringify(searchedList);
		$.cookie("recentlySearched",objectJSON,{path: '/', expires:7});
		updateRecentlySearched();
		
	}else{
		searchedList = $.parseJSON(searchedList);
		
		if(!containsObject(object,searchedList)){
			
			if(searchedList.length<5){
				searchedList.unshift(object);
			}else{
				searchedList.pop();
				searchedList.unshift(object);
			}
			
			objectJSON = JSON.stringify(searchedList);
			$.cookie("recentlySearched",objectJSON,{path: '/', expires:7});
			updateRecentlySearched();
		}
	}
	
	
}

function doSearchOptimized(category,placeName){
	
	
	
	setInitPanAndZoom();

	$.ajax({
		type: "Get",
		url: "/UPMap/findPlaceByCategoryAndName",
		data: "category=" + category +"&placeName=" +placeName,
		success: function(json){
			
			hideAll();
			showResults();
			
			if(json){
			
				var searchString;
				
				
				var place = $.parseJSON(json);
				if(place) {
					if(placeName!="")
						searchString = placeName;
					else
						searchString = place[0].placeCategory;
						
					if(place.length>1)
						$("div#results").append('<p><b style="font-size:20px">'+ searchString+'</b><br />'+ place.length +' results found.</p>');
					else
						$("div#results").append('<p><b style="font-size:20px">'+ searchString+'</b><br />'+ place.length +' result found.</p>');
					
					var string = "";
					var page = 1;
					for(var i = 0; i < place.length; i++) {
						
						var count = i % 10;
						var letter= String.fromCharCode('A'.charCodeAt() + count);
						
						if(count==0) {
							string = string + '<div id="results-' + page +'" class="results-page">';
						}
						string = string + '<div class="results-item">';
						string = string + '<div class="marker-label"><a class="map-marker">'+letter+'</a></div>';
						string = string + '<div class="results-details"><a class="place-link" data-index="'+ i + '" data-placename="'+place[i].placeName +'" data-latitude="' +place[i].placeLat + '" data-longitude="'+place[i].placeLong +'">' + place[i].placeName + '</a><br />';
						string = string + '<p class="small-note">Category: <a class="category-link">'+ place[i].placeCategory +'</a></p></div>';
						
						
						var myPlaceObj = new Object({
							userId: userId,
							placeId: place[i].placeId,
							placeName: place[i].placeName
						});
						var starclass = '';
						if(containsObject(myPlaceObj,myPlacesList)){
							starclass = 'favorite-star fa fa-star active';
						}else{
							starclass = 'favorite-star fa fa-star';
						}
						
						string = string + '<div class="favorite-star-wrapper"><a class="'+ starclass +'" data-placeid="'+place[i].placeId +'"></a></div>';
						string = string + '</div>';
						
						if(count==9||i==place.length-1) {
							string = string + '</div>';
							$("div#results").append(string);
							page++;
							string = "";
						}
						
						
						
						var markerPosition = new google.maps.LatLng(place[i].placeLat,place[i].placeLong);
						var newMarker = new google.maps.Marker({
						    position: markerPosition,
						    map: map,
						    title: place[i].placeName,
						    placeId: place[i].placeId,
						    index: count
						      
						});
						
						var markerIcon = new google.maps.MarkerImage(
							    'resources/img/marker'+letter+'.png',
							    null, /* size is determined at runtime */
							    null, /* origin is 0,0 */
							    null, /* anchor is bottom center of the scaled image */
							    new google.maps.Size(32,45)
							);  
						newMarker.setIcon(markerIcon);
						markerArray.push(newMarker);
					
						if(i<10)
							newMarker.setMap(map);
						else
							newMarker.setMap(null);
						
						/*--------------------------------------------------
						Object: marker
						Event: click
						Function: Shows information box about UP 
						-----------------------------------------------------*/
						google.maps.event.addListener(newMarker, 'click', function() {
							zoomFluid = map.getZoom();
							infoWindow.close();
							map.panTo(this.getPosition());
							
							infoWindow.setContent('<div class="info-window"><p>'+this.title+'</p></div>');
							
							infoWindow.open(map, this);
							getJeepneysToPlace(this.placeId);
							if(zoomFluid<=17)
								zoomTo();
							else
								zoomOut();
						});
						
					}
					
					
					
					$(document).ready(function() {
			    	    $(".place-link").click(function() {
			    	    	var placeLat = $(this).data("latitude");
			    	    	var placeLong = $(this).data("longitude");
			    	    	var placeName = $(this).data("placename");
			    	   		var index = $(this).data("index");
			    	    	new google.maps.event.trigger( markerArray[index], 'click' );
							
			    	    	var object = new Object();
			    	    	
			    	    	object={	placeName: placeName,
			    	    				placeLat: placeLat,
			    	    				placeLong: placeLong  };
			    	    	
			    	    	addRecentlySearchedPlace(object);
			    	    });
			    	    
			    	    $(".favorite-star").click(function() {
			    	    	
			    	    	if(!$(this).hasClass('active')){
			    	    		var placeId = $(this).data("placeid");
				    	    	if($.ajax({
				    	    		type: "Post",
				    	    		url: "/UPMap/insertMyPlace",
				    	    		data: "userId="+userId+"&placeId="+placeId,
				    	    		success: function(){
				    	    			getMyPlaces();
					    	    		
				    	    			return true;
				    	    		},
				    	    		error: function(){
				    	    			return false;
				    	    		}
				    	    		}
				    	    	
				    	    	)){
				    	    		$(this).addClass('active');
				    	    		
				    	    	}
			    	    		
			    	    	}else{
			    	    		var placeId = $(this).data("placeid");
				    	    	if($.ajax({
				    	    		type: "Post",
				    	    		url: "/UPMap/removeMyPlace",
				    	    		data: "userId="+userId+"&placeId="+placeId,
				    	    		success: function(){
				    	    			getMyPlaces();
					    	    		
				    	    			return true;
				    	    		},
				    	    		error: function(){
				    	    			return false;
				    	    		}
				    	    		}
				    	    	
				    	    			
				    	    	
				    	    	)){
				    	    		$(this).removeClass('active');
				    	    		
				    	    	}
			    	    	}
			    	    });

			    	    $(".category-link").click(function() {
			    	    	var category = "";
			    	    	var placeName = $(this).text();
			    	    	doSearchOptimized(category,placeName);
			    	    });
			    	});
					
					paginateResults(1,page);
					if(page-1>1)
						createPageLinks(page);
					
					
				}
				
				
			
			}else{
				document.getElementById('results').innerHTML="<p>Sorry, no results found.</p>";
				return false;
			}
			
			
			
  
			
		},
		error: function(e){
			alert("Error: "+ e);
		}
		
	});
	
}

function createPageLinks(pageCount){
	
	var index = 1;
	pagelinks = "<div><br/>";
	for(var i=0; i<pageCount-1; i++){

		if(i==0){

			pagelinks = pagelinks +'<a class="page-links active">'+ index +'</a>';
		}else{

			pagelinks = pagelinks +'<a class="page-links">'+ index +'</a>';
		}
		
		index++;
	}
	
	pagelinks = pagelinks +  "<br/></div>";
	$("div#results").append(pagelinks);
	

	$(".page-links").click(
			function(){
				index = $(this).html();
				lowerRange = (index*10)-10;
	
				upperRange = (index*10)-1;
				paginateResults(index , pageCount);
				$("a.page-links").removeClass("active");
				$(this).addClass("active");
			
				for(var i=0;i< markerArray.length; i++){
					if(i>=lowerRange && i<=upperRange){
						markerArray[i].setMap(map);
					}else{
						markerArray[i].setMap(null);
					}
							
					
			
				}
				
				
			});
			
	
}

function paginateResults(pageIndex, pageCount){
	var index = 1;
	pagelinks = "<br/>";
	for(var i=0; i<pageCount-1; i++){
		
		var target = "div#results-" + index;
		
		if(i==pageIndex-1){
			$(target).show();

		}else{
			$(target).hide();

		}
		
		
		index++;
	}
	
	
}

function categoryOnChange(){
	
	var category = $( "#categorySelect option:selected" ).val();
	var placeName = $('#searchPlaceName').val();
	
	autoCompleteCategory = category;
	getAllPlaceNames();
	
	
	if(category=="" && placeName==""){
		
		hideResults();
		showOrHideFeature();
	}
		
	else
		doSearchOptimized(category,placeName);
	
}


function zoomTo(){
    //console.log(zoomFluid);
    if(zoomFluid==17) return 0;
    else {
         zoomFluid ++;
         map.setZoom(zoomFluid);
         setTimeout("zoomTo()", 500);
    }
}

function zoomOut(){
    //console.log(zoomFluid);
    if(zoomFluid==15) return 0;
    else {
         zoomFluid --;
         map.setZoom(zoomFluid);
         setTimeout("zoomOut()", 500);
    }
}
/*----------------------------------------------------
Object: window
Event: load
Function: initializes the map on window load
------------------------------------------------------*/
google.maps.event.addDomListener(window, 'load', initialize);

function getCategories(){
	
	$.ajax({
		type: "Get",
		url: "/UPMap/getCategories",
		success: function(json){
			categoryList = $.parseJSON(json);
			$("select#categorySelect").append('<option value="">Select a category</option>');
			for(var i=0; i<categoryList.length ; i++){
			
				$("select#categorySelect").append('<option value="' + categoryList[i].categoryId+'">'+categoryList[i].categoryName +'</option>');
			}
			
		},
		error: function(e){
			return null;
		}
	});
}

function searchPlaceClick(){
	
	var category = $( "#categorySelect option:selected" ).val();
	var placeName = $('#searchPlaceName').val();
	if(placeName!="")
	doSearchOptimized(category,placeName);

}

function searchPlaceEnter() {
	
	var category = $( "#categorySelect option:selected" ).val();
	var placeName = $('#searchPlaceName').val();
	
	$( "#searchPlaceName" ).autocomplete( "close" );
	
	if(placeName!="")
		doSearchOptimized(category,placeName);
	
	
}

function getPlacesPassedByJeepney(){
	
	$.ajax({
	
		type: "Get",
		url: "/UPMap/getPlacesPassedByJeepney",
		success: function(json){
			
		},
		error: function(e){
			alert("error: " + e);
		}
		
	}
	);
	
	
}

function getJeepneysToPlace(placeId){
	

	$.ajax({
	
		type: "Get",
		url: "/UPMap/getJeepneysToPlace",
		data: "placeId="+placeId,
		success: function(json){
			if(json!=null){
				jeepneys = $.parseJSON(json);
				if(jeepneys.length>0){
					$("div.info-window").append('<p>Jeepneys Passing By:</p>');
					for(var i = 0; i < jeepneys.length; i++){
						$("div.info-window").append(jeepneys[i] + '<br />');
					}
				}
				
			}
			
		},
		error: function(e){
			alert("error: " + e);
		}
		
	}
	);
	
	
}



$(document).ready(function(){

	getPlacesPassedByJeepney();
	getCategories();
	getAllPlaceNames();
	getMyPlaces();
	updateMyPlaces();
	updateRecentlySearched();
	
	$('.jeepney-places-button').click(
			function(){
				var target = "div"+$(this).attr("href");
				if($(target).hasClass("hidden")){
					$(target).removeClass("hidden");
					
				}else{
					$(target).addClass("hidden");
					
				}
				
				return false;
			}
			
			
	);
	
	
	
});


$(document).keyup(function(e){
	
	
   if($('#searchPlaceName').is(':focus')) {
	   
	   
	   var category = $( "#categorySelect option:selected" ).val();
	   var placeName = $('#searchPlaceName').val();

	   if(placeName!=""){
		   
		   if(e.keyCode == 32){
			      
			   doSearchOptimized(category, placeName);
				
		   }else if(e.keyCode==8){
			   hideResults();
		   }
		   
		   
		   
	   }else if(category!=""&&placeName==""){
		   doSearchOptimized(category, placeName);
	   }else if (category==""&&placeName==""){
		   hideResults();
	   }
	   
   }
   
});

