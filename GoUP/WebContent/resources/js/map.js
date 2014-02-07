var map;
var marker;
var infoWindow = new google.maps.InfoWindow();
 
var upIkotRoutePath;
var upTokiRoutePath;
var upKatipRoutePath;
var upPhilcRoutePath;
var visiblePath = [0,0,0,0,0];

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
								new google.maps.LatLng(14.647597, 121.071383),
								new google.maps.LatLng(14.648562, 121.070761), //Math
								new google.maps.LatLng(14.648531, 121.070697),
								new google.maps.LatLng(14.647576, 121.071319), //CPG again
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
	
	var myLatlng = new google.maps.LatLng(14.649361,121.055725); 
  	var mapOptions = {
    		center: myLatlng,
    		zoom: 15,
    		disableDefaultUI: false
  	};
  	map = new google.maps.Map(document.getElementById("map-canvas"),
      	mapOptions);
  	
  	
  	
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
             strokeOpacity: 0.70,
             strokeWeight: 3
           });
	
	upTokiRoutePath = new google.maps.Polyline({
             path: upTokiRouteCoordinates,
             geodesic: true,
             strokeColor: '#7f00ff',
             strokeOpacity: 0.70,
             strokeWeight: 3
           });

	
	upKatipRoutePath = new google.maps.Polyline({
             path: upKatipRouteCoordinates,
             geodesic: true,
             strokeColor: '#f00',
             strokeOpacity: 0.70,
             strokeWeight: 3
           });

	
	upPhilcRoutePath = new google.maps.Polyline({
             path: upPhilcRouteCoordinates,
             geodesic: true,
             strokeColor: '#0f0',
             strokeOpacity: 0.70,
             strokeWeight: 3
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
var previousPlace=null;
var zoomFluid;

function doSearchPlace(){
	
	var placeName = $('#searchPlaceName').val();
	if(previousPlace==placeName)
		return false;
	
	previousPlace = placeName;
	
	$.ajax({
		type: "Get",
		url: "/UPMap/findPlace",
		data: "placeName=" + placeName,
		success: function(json){
			
			if(json){
				
				var place = $.parseJSON(json);
				var placeLat = place.placeLat;
				var placeLong = place.placeLong;
				myLatLng = new google.maps.LatLng(placeLat,placeLong);
				
				/*Set the map marker position*/
				var markerPosition = myLatLng;
				
				if (marker){
					marker.setPosition(markerPosition);
				}else{
					marker = new google.maps.Marker({
					    position: markerPosition,
					    map: map,
					    title: place.placeName
					      
					});
					
				}
				infoWindow.close();
				marker.setMap(map);
				
				zoomFluid = map.getZoom();
				map.panTo(myLatLng);
				zoomTo();
			
			
				
				
				/*--------------------------------------------------
				Object: marker
				Event: click
				Function: Shows information box about UP 
				-----------------------------------------------------*/
				google.maps.event.addListener(marker, 'click', function() {
					
					infoWindow.setContent(place.placeName);
				    infoWindow.open(map,marker);
				});
				
			}else{
				
				document.getElementById('errormessage').innerHTML="Sorry, no results found.";
			}
			
			
			
  
			
		},
		error: function(e){
			alert("Error: "+ e);
		}
		
	});
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

/*----------------------------------------------------
Object: window
Event: load
Function: initializes the map on window load
------------------------------------------------------*/
google.maps.event.addDomListener(window, 'load', initialize);




function searchPlaceEnter() {
	
	doSearchPlace();

}