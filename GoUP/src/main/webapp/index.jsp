<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	function initialize() {
    	
    		var myLatlng = new google.maps.LatLng(14.650306,121.05205); //Maharlika St. in front of Elliptical Road
  	    	var mapOptions = {
  	      		center: myLatlng,
  	      		zoom: 15
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
      
	      	var contentString = '<div id="content">'+
	      	'<div id="siteNotice">'+
	      	'</div>'+
	      	'<h3 id="firstHeading" class="firstHeading">You are at The University of the Philippines Diliman</h3>'+
	      	'<div id="bodyContent">'+
	     	'<p><b>The University of the Philippines Diliman</b> (commonly referred to as UP Diliman, or informally, Peyups), is a coeducational and public research university located in Quezon City, Philippines. It is the flagship campus, seat of administration, and the fourth oldest constituent university of the University of the Philippines System, the national university of the Philippines.</p>'+
	      	'<p><span style="font-size: 11px !important;">Attribution: The University of the Philippines Diliman, <a style="font-size: 11px" href="http://en.wikipedia.org/wiki/University_of_the_Philippines_Diliman">'+
	      	'http://en.wikipedia.org/wiki/University_of_the_Philippines_Diliman</a></span> '+
	      	'.</p>'+
	      	'</div>'+
	      	'</div>';

			var infowindow = new google.maps.InfoWindow({
			      content: contentString
			  });
			
			/*Set the map marker position*/
			var markerPosition = new google.maps.LatLng(14.654863,121.064302);
			var marker = new google.maps.Marker({
			      position: markerPosition,
			      map: map,
			      title: 'The Oblation, U.P. Diliman'
			      
			});
			
			
			
			/*--------------------------------------------------
				Object: marker
				Event: click
				Function: Shows information box about UP 
			-----------------------------------------------------*/
			google.maps.event.addListener(marker, 'click', function() {
			    infowindow.open(map,marker);
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

    	/*----------------------------------------------------
		Object: window
		Event: load
		Function: initializes the map on window load
		------------------------------------------------------*/
	  	google.maps.event.addDomListener(window, 'load', initialize);
	  
	  	
	  	

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
	

	<div id="map-wrapper" class="hi-icon-effect-6">
	

		<div id="map-canvas" >
    	</div>

  
    	<div id="nav" class="overlay circle nav-collapse in">
    	<ul>
    		<li><a><i class="fa fa-search fa-lg"></i>Search</a></li>
    		<li><a><i class="fa fa-map-marker fa-lg"></i>My Places</a></li>
    		<li><a><i class="fa fa-star fa-lg"></i>Extras</a></li>
    		
    	</ul>
       	</div>
    
    	
    	<div id="goup-logo" class="overlay circle logo">
    	</div>

    </div>
    <!-- end of map wrapper -->
    

    
  </body>
</html>


