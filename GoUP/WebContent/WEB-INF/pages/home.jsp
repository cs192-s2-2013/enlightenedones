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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <!--End Including Stylesheets-->
    
    <!-- Include JS Plugins -->
     

    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js" />"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry&key=AIzaSyCblPnV936VjhXRneHrOKPl_aB1hozPlFU&sensor=false">
    </script>
    <script type="text/javascript" src="<c:url value="/resources/js/map.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.cookie.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/underscore-min.js" />"></script>
  
    <!--End Including JS Plugins-->
 	
 
        
    <script type="text/javascript">
    	 // calling function from here
    	/*-------------------------
    	Function: 	Gets the height of the window screen 
    				and sets it as the height of the map wrapper
    	--------------------------*/
    	function setWrapperHeight(){
    		var height = $(window).innerHeight() - 90;
    		if(height<300)
    			height=300;
    		$("#big-wrapper").css("height",height);
    		$("#map-wrapper").css("height",height);
    		$("#welcome").css("height",height);
    		$("#side-box").css("height",height);
    		$(".feature-panel").css("height",height);
    	}
    	
    	function setWrapperWidth(){
    		
    		var width = screen.availWidth;
    		$("#nav").css("width",width);
    		$("#big-wrapper").css("width",width);
    		$("#side-box").css("width",width * 0.30);    		
    		$("#map-wrapper").css("width",width * 0.70);    		
    		
    		
    	}
    	
    	
    	//Sets map wrapper height when page has loaded
    	$(document).ready(
    			function(){
    				setWrapperWidth();
    				setWrapperHeight();
    				
    				
    				$(".myplaces-tab-button").click(
    						function(){
    							if($(this).hasClass("active")){
    								return false;
    							}else{
    								$(".myplaces-tab-panel").removeClass("active");
    								$(".myplaces-tab-button").removeClass("active");
    								var target= "div"+$(this).data("target");
    								$(target).addClass("active");
    								$(this).addClass("active");
    							}
    						});
    				
    				$('section[data-type="background"]').each(function(){
    				      var $backgroundObj = $(this); // assigning the object
    				      
    				      $(window).scroll(function() {
    				    	  var yPos = -($window.scrollTop() / $backgroundObj.data('speed'));
    				    	  
    				    	// Put together our final background position
    				            var coords = '50% '+ yPos + 'px';
    				    	
    				         // Move the background
    				            $bgobj.css({ backgroundPosition: coords });
    				      });
    				    }); 
    				
    				$('#findPlace').click(function(){
    					$("#searchPlaceName").focus().tap();
    				});
    				showOrHideFeature();
    			    			});
    	
    		
    	//Sets map wrapper height when page has resized
    	$(window).resize(setWrapperHeight); 
    	
    </script>
    
  </head>
  <body>
  	
  	<div id="nav">
  		<a id="goup-logo">
		</a>
		
		<div id="searchForm">
		
			<div class="styled-select">
			
				<select id="categorySelect" onchange="categoryOnChange();">
	  				<option value="">Select a category</option>
	  				<option value="AAS">Administration and Support</option>
	  				<option value="CSSP">College of Social Science and Philosophy</option>
	  				<option value="DORMS">Dormitories</option>
	  						
	  			</select>
			
			</div>
			
	  		
	  		<input id="searchPlaceName" placeholder="Type the name of the place" type="text" onKeyUp="if (event.keyCode == 13) searchPlaceEnter();"/>
			<a id="searchButton" class="btn" type="button" onclick="searchPlaceClick();"><i class="fa fa-search"></i></a>
		</div>
	  	
	  	<div id="menu">
	  		<div class="icon-title"><a onclick="viewMyPlaces();"><span class="menu-icon icon-myplaces"></span>My Places</a></div>
	  		<div class="icon-title"><a><span class="menu-icon icon-directions"></span>Get Directions</a></div>
	  		<div class="icon-title"><a onclick="showJeepneyRoutes();"><span class="menu-icon icon-jeepney"></span>Jeepney Routes</a></div>
	  		<br />
	  		<div class="icon-title"><a><span class="menu-icon icon-help"></span>Help</a></div>
	  	
	  	</div>
	  					
	  					
	  					
	  				
	  					
	  			
  	</div>

	<div id="big-wrapper">
	
	<!-- begin of map-wrapper -->
	<div id="side-box">
		
	  		
	  			<%
	  			
	  			if(request.getAttribute("message")!=null) {
	  				out.print(" <div class=\"alert alert-success alert-dismissable\">");
	  				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>");
	  				out.print(request.getAttribute("message"));
	  				out.print("</div>");
	  			}
	  			%>
	  			<div id="welcome"style="display:none;">
	  				<section id="one" class="feature-panel" data-type="background" data-speed="10">
	  					<div class="feature-text">
	  						<div class="feature-title">Welcome to Go UP!</div>
	  						<div class="feature-tagline">A University of the Philippines Diliman Online Map</div>
	  					</div>
	  					<div class="arrow-text">Scroll Down To See More</div>
	  					<a class="arrow"></a>
	  					
	  				</section>
	  			
	  			
	  				<section id="two" class="feature-panel" data-type="background" data-speed="10">
	  					<div class="feature-text">
		  					<div class="feature-title">Find Places in UP Diliman</div>
		  					<div class="feature-tagline">GoUP makes searching places 
		  					in the campus better and faster 
		  					with its optimized categorized
		  					search.</div>
	  					</div>
	  					<div id="findPlace" class="feature-button">Find a Place</div>
	  				</section>
	  				
	  				<section id="three" class="feature-panel" data-type="background" data-speed="10">
	  					<div class="feature-text">
		  					<div class="feature-title">Get Directions</div>
		  					<div class="feature-tagline">GoUP helps you to get travel directions
							,in the campus,from one location to another including
							info about travel time and modes of
							transportation.</div>
	  					</div>
	  				</section>
	  			</div>
	  			
	  			<div id="results" class="hidden">
	  			
	  			</div>
	  				  	
	  			
	  			<div id="jeepneyRoutes" style="display:none;">
	  			
	  			
	  				<b style="font-size:20px;">Jeepney Routes</b>
	  				
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-ikot" onclick="ikotRoute();">UP Ikot</a>
							<a href="#ikot-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						</div>
						
						<div id="ikot-route-places" class="jeepney-and-places hidden">
						</div>
						
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-toki" onclick="tokiRoute();">UP Toki</a>
							<a href="#toki-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						
						</div>
						
						<div id="toki-route-places" class="jeepney-and-places hidden">
						</div>
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-katip" onclick="katipRoute();">Katipunan-UP</a>
							<a href="#katip-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						</div>
						
						<div id="katip-route-places" class="jeepney-and-places hidden">
						</div>
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-philcoa" onclick="philcRoute();">Philcoa-UP</a>
							<a href="#philcoa-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						</div>
						
						<div id="philcoa-route-places" class="jeepney-and-places hidden">
						</div>
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route" onclick="allRoute();">Show All</a>
						</div>
						
			
	  			
	  			</div>
	  			
	  			<div id="myPlaces" style="display:none;">
	  				<b style="font-size:20px;">My Places</b>
	  				<div class="myplaces-tab">
	  				<div class="myplaces-tab-button active" data-target="#favorites">Favorites</div>
	  				<div class="myplaces-tab-button" data-target="#recent">Recent</div>
	  				</div>
	  				<div id ="favorites" class="myplaces-tab-panel active">
	  				</div>
	  				<div id ="recent" class="myplaces-tab-panel">
	  				</div>
	  				
	  			</div>
	  			
	  			
	  			
	  			
	  			
	  			
	  			
	  			
	  			
	  			
	  		
  		</div>

	<div id="map-wrapper">
	

		<div id="map-canvas" >
    	</div>
		
  		
  
    	
    	
    
    </div>
    <!-- end of map wrapper -->
    </div>

    
  </body>
</html>


