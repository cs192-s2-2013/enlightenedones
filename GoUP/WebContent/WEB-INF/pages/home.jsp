<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>Home | GoUP</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
    <!--Include Stylesheets -->
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/font-awesome.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/global.css" />" rel="stylesheet"/>
    <!--End Including Stylesheets-->
    
    <!-- Include JS Plugins -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/bootstrap.js" />"></script>
    <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCblPnV936VjhXRneHrOKPl_aB1hozPlFU&sensor=false">
    </script>
    <!--End Including JS Plugins-->
 	
 
    
 	<script type="text/javascript">
    
 		var map;
 		var marker;
 		var infoWindow = new google.maps.InfoWindow();
    	function initialize() {
    	
    		var myLatlng = new google.maps.LatLng(14.650306,121.05205); //Maharlika St. in front of Elliptical Road
  	    	var mapOptions = {
  	      		center: myLatlng,
  	      		zoom: 15,
  	      		disableDefaultUI: false
  	    	};
  	    	map = new google.maps.Map(document.getElementById("map-canvas"),
  	        	mapOptions);
  	    	
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
  	    	var upMapBoundaryPath = new google.maps.Polyline({
  	    	                 path: upMapBoundaryCoordinates,
  	    	                 geodesic: true,
  	    	                 strokeColor: '#A23030',
  	    	                 strokeOpacity: 0.55,
  	    	                 strokeWeight: 3
  	    	               });

  	    	upMapBoundaryPath.setMap(map);
      
			
			
			
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
			
			var upIkotRoutePath = new google.maps.Polyline({
	                 path: upIkotRouteCoordinates,
	                 geodesic: true,
	                 strokeColor: '#fff000',
	                 strokeOpacity: 0.70,
	                 strokeWeight: 3
	               });

			upIkotRoutePath.setMap(map);
			
			
			
			
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
    	


    	function doSearchPlace(){
        	var placeName = $('#searchPlaceName').val();
    		$.ajax({
    			type: "Get",
    			url: "/UPMap/findPlace",
    			data: "placeName=" + placeName,
    			success: function(json){
    				var place = $.parseJSON(json);
    				var placeLat = place.placeLat;
    				var placeLong = place.placeLong;
    				myLatLng = new google.maps.LatLng(placeLat,placeLong);
    				map.panTo(myLatLng);
    			
    			
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
    				
    				/*--------------------------------------------------
    				Object: marker
    				Event: click
    				Function: Shows information box about UP 
	    			-----------------------------------------------------*/
	    			google.maps.event.addListener(marker, 'click', function() {
	    				
	    				infoWindow.setContent(place.placeName);
	    			    infoWindow.open(map,marker);
	    			});
    	  
    				
    			},
    			error: function(e){
    				alert("Error: "+ e);
    			}
    			
    		});
    	}
    	

    	/*----------------------------------------------------
		Object: window
		Event: load
		Function: initializes the map on window load
		------------------------------------------------------*/
	  	google.maps.event.addDomListener(window, 'load', initialize);
	  
	  	
	  	

    </script>
    
    <script>

    	function searchPlaceEnter() {
	    	doSearchPlace();
		
	    	};
	
	</script>

    
    <script>
    
	
    	/*-------------------------
    	Function: 	Gets the height of the window screen 
    				and sets it as the height of the map wrapper
    	--------------------------*/
    	function setWrapperHeight(){
    		var height = $(window).height();
    		$("#map-wrapper").css("height",height);
    	}
    	
    	//Sets map wrapper height when page has loaded
    	$(document).ready(setWrapperHeight);
    	//Sets map wrapper height when page has resized
    	$(window).resize(setWrapperHeight); 
    	
    
    </script>
    
  
    <script>
    
	    /*----------------------------------------------------
		Object: document
		Event: ready
		Function: Adds hover listener to the nav bar
		------------------------------------------------------*/
		$(document).ready(function(){
			
	
			
			$("#goup-logo").hover(
				function(){
					$("#nav").addClass("out");
				
				}
				
			
			);
			
			$("#nav").mouseleave(
				function(){
					$("#nav").removeClass("out");
					$("#nav").removeClass("out-fixed");
				
				}
			);
			
			
			
		});
		
    	
    	
    
    </script>
    
    
    
    
    
  </head>
  <body>

	<!-- begin of map-wrapper -->
	<div id="side-box" class="col-md-3">
	
		<div id="goup-logo" class="overlay circle logo">
    	</div>
	
	  		<div class="side-box-inner">
	  			<%
	  		
	  			
	  			if(request.getAttribute("message")!=null) {
	  				out.print(" <div class=\"alert alert-success alert-dismissable\">");
	  				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>");
	  				out.print(request.getAttribute("message"));
	  				out.print("</div>");
	  			}
	  			%>
	  			
	  			<form id="searchPlace" onkeypress="return event.keyCode != 13;">
	  				<h3>Search Place</h3>
	  				<table>
	  				
	  					<tr>
	  					<td>Place Name:</td>
	  					<td><input id="searchPlaceName" type="text" class="form-control" onKeyUp="if (event.keyCode == 13) searchPlaceEnter();"/></td>
	  					</tr>
	  					
	  				  					
	  					<tr>
						<td></td>
						<td><input class="btn btn-primary" type="button" value="Search" onclick="doSearchPlace();" /></td>
						</tr>
	  					
	  				</table>
	  			</form>
	  			
	  			<form:form method="post" action="/insertPlace" modelAttribute="place">
	  				<h3>Add Place</h3>
	  				<table>
	  				
	  					<tr>
	  					<td>Place Name:</td>
	  					<td><form:input class="form-control" path="placeName" /></td>
	  					</tr>
	  					
	  					<tr>
	  					<td>Latitude:</td>
	  					<td><form:input class="form-control" path="placeLat" /></td>
	  					</tr>
	  					
	  					<tr>
	  					<td>Longitude:</td>
	  					<td><form:input class="form-control" path="placeLong" /></td>
	  					</tr>
	  					
	  					<tr>
						<td></td>
						<td><input class="btn btn-danger" type="submit" value="Save" /></td>
						</tr>
	  					
	  				</table>
	  			</form:form>
	  		</div>
  		</div>

	<div id="map-wrapper" class="col-md-9">
	

		<div id="map-canvas" >
    	</div>
		
  		
  
    	
    	
    
    </div>
    <!-- end of map wrapper -->
    

    
  </body>
</html>


