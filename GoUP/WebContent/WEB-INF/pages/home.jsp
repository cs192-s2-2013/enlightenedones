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
    <link href="<c:url value="/resources/css/joyride-2.1.css" />" rel="stylesheet"/>
 
    <!--End Including Stylesheets-->
    
    <!-- Include JS Plugins -->
     

    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.joyride-2.1.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modernizr.mq.js" />"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry&key=AIzaSyCblPnV936VjhXRneHrOKPl_aB1hozPlFU&sensor=false">
    </script>
    <script type="text/javascript" src="<c:url value="/resources/js/html2canvas.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/map.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.cookie.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/underscore-min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.simpleWeather.js" />"></script>
  
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
    					$("#searchPlaceName").focus();
    					
    					
    				});
    				
    		

    				
    				$('#buttonScreen').click(function(){
    					html2canvas($('#map-canvas'), {
  						  proxy: "proxy.js",
  						  useCORS: true,
  						  logging: true, 
  						  onrendered: function(canvas) {
  							var img = canvas.toDataURL();
  							
  							window.open(img);
  							
  							
  						  }
  						});
    					
    				});
    				
    				
    				
    				showOrHideFeature();
    				$('ul.ui-autocomplete').removeAttr('style');
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
	  				
	  			</select>
			
			</div>
			
	  		
	  		<input id="searchPlaceName" placeholder="Type the name of the place" type="text" onKeyUp="if (event.keyCode == 13) searchPlaceEnter();"/>
			<a id="searchButton" class="btn" type="button" onclick="searchPlaceClick();"><i class="fa fa-search"></i></a>
		</div>
	  	
	  	<div id="menu">
	  		<div id= "buttonPlace" class="icon-title"><a onclick="viewMyPlaces();"><span class="menu-icon icon-myplaces"></span>My Places</a></div>
	  		<div id= "buttonDirect" class="icon-title"><a onclick="viewGetDirections();"><span class="menu-icon icon-directions"></span>Get Directions</a></div>
	  		<div id= "buttonRoute" class="icon-title medium"><a onclick="showJeepneyRoutes();"><span class="menu-icon icon-jeepney"></span>Jeepney</a></div>
	  		<div id= "buttonTrivia" class="icon-title"><a onclick="showTrivia();"><span class="menu-icon icon-help"></span>Trivia</a></div>
	  		<br />
	  		<div id= "buttonScreen" class="icon-title"><a><span class="menu-icon icon-screenshot"></span>Screenshot</a></div>
	  		<div id= "buttonWeather" class="icon-title"><a onclick="showWeather();"><span class="menu-icon icon-weather"></span>Weather</a></div>
	  		<div id= "buttonHelp" class="icon-title medium"><a onclick="showHelp();"><span class="menu-icon icon-help"></span>Help</a></div>
	  		<div id= "buttonSettings" class="icon-title medium"><a onclick="showSettings();"><span class="menu-icon icon-help"></span>Settings</a></div>
	  	

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
	  				
	  				<section id="four" class="feature-panel" data-type="background" data-speed="10">
	  					<div class="feature-text">
		  					<div class="feature-title">Save Your Favorite Places</div>
		  					<div class="feature-tagline">GoUP lets its users to save their favorite places
		  					using the yellow stars, making it easier to locate these places.</div>
	  					</div>
	  				</section>
	  			</div>
	  			
				<div id = "getDirections" style="display:none;">
		  			<form id="findPath" onkeypress="return event.keyCode != 13;">
		  				<b style="font-size:20px;">Get Directions</b>
		  				<input id="searchOriginPlaceName" class="search-input" placeholder="Where are you now?" type="text" />
		  				<input id="searchDestinationPlaceName" class="search-input" placeholder="Where are you going?" type="text"/>
		  				<input id="searchPathButton" class="btn btn-primary" type="button" value="Get Directions" onclick="path();" />
		  				
		  				<label>Waypoints:</label><select id="waypoints" onchange="addWaypts(this.value);">
		  				
		  					<option value="0">0</option>
		  					<option value="1">1</option>
		  					<option value="2">2</option>
		  					<option value="3">3</option>
		  					<option value="4">4</option>
		  					<option value="5">5</option>
		  					<option value="6">6</option>
		  					<option value="7">7</option>
		  				</select>
		  				<br /><label>Loose Priority:</label><input id="optimizeWaypoints" type="checkbox" />
		  			</form>
		  			<div id="routes">
	  			
	  				</div>
	  				
	  				<div id = "routelength">
	  				
	  				</div>
		  			<div id="waypts">
		  			
		  			</div>
		  			
		  			
	  			</div>
	  			
	  			
	  	

	  			<div id="results" style="display:none;">
	  			
	  			</div>
	  			
	  		

	  			<div id="weather" style="display:none;">
	  			
	  			
	  			
	  			</div>
	  			
	  			<div id="settings" style="display: none;">
	  			<form id="findPath" onkeypress="return event.keyCode != 13;">
		  				<b style="font-size:20px;">Add Place</b>
		  				<input id="placeName" class="search-input" placeholder="Place Name" type="text" />
		  				<input id="placeLatitude" class="search-input" placeholder="Latitude" type="text"/>
		  				<input id="placeLongitude" class="search-input" placeholder="Longitude" type="text"/>
		  				<input id="addPlaceButton" class="btn btn-primary" type="button" value="Add Place" onclick="" />
		  				
		  		</form>
	  			</div>
	  			
	  			<div id="trivia" style="display:none;">
	  				<div class="title">FUN FACTS AND TRIVIA ABOUT UP DILIMAN.<br/><br /></div>
					1. The bird in the UP Seal is a parrot not an eagle.<br/><br/>
					2. There is only 1 coconut tree around the sunken garden.<br/><br/>
					3. Sunken garden is still sunking.<br/><br/>
					4. in 1960's lagoon is a golf course.<br/><br/>
					5. The original oblation can be found in the archives section of the main library<br/><br/>
					6. Fernando Poe Sr. is the model of oblation.<br/><br/>
					7. Color coding for jeep, yellow for ikot and toki, red for katipunan and green for sm, pantranco and philcoa.<br/><br/>
					8. CAL, CSSP and CS is called tricol.<br/><br/>
					9. Aristocarts are the original names of shops that sells pancit canton, kwek-kwek etc.<br/><br/>
					10. Acad Oval is 2.2 kilometers long.<br/><br/>
					11. Theres a room  directly below oblation.<br/><br/>
					12. There's a virgin forest inside UP it is called Arboretum.<br/><br/>
					13. The official name of Sunken Garden is General Luna Parade Grounds.<br/><br/>
					14. You can rotate the sculpture in front of College of Business Administration.<br/><br/>
					15. You can not enter DMST wearing only shorts or slippers.<br/><br/>
					16. The one who design UP Chapel is Leandro Locsin, First National  Artist for Architecture.<br/><br/>
					17. The original statue of Bonifacio if moved from Balintawak to Vinzon's Hall.<br/><br/>
					18. There is a University wide Prom, the Cadena de Amor.<br/><br/>
					19. Every monday in front of Palma Hall, National anthem and UP naming mahal is played.<br/><br/>
					20. Oblation is 3.5 meters tall and symbolizes 359 years of Spanish Regime.<br/><br/>
					21. UP College of Architecture is the only College that offers landscape architecture course in the Philippines.<br/><br/>
					22. There's one and only intersection in the UP where traffic light is working, the Melchor and Tennis court intersection.<br/><br/>
					23. UP is a non-smoking area.<br/><br/>
					24. UP Observatory is the highest point in UP Diliman.<br/><br/>
					25. Sunken Garden is the lowest point in UP Diliman.<br/><br/>
					26. Ikot, SM and pantranco jeeps are out aroung 9pm, katipunan jeep around 10pm and Philcoa is around 11pm.<br/><br/>
					Source: http://forexampaul.tumblr.com/post/4607795763<br /><br/>
						  			
	  			</div>
	  			
	  			<div id="jeepneyRoutes" style="display:none;">
	  			
	  				
	  				<b style="font-size:20px;">Jeepney Routes</b>
	  				
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-ikot" onclick="ikotRoute();">UP Ikot</a>
							<a href="#ikot-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						</div>
						
						<div id="ikot-route-places" class="jeepney-and-places hidden">
							Virata Hall - Institute of Small Scale Industries (ISSI) <br />
							New LRT <br />
							Albert Hall <br />
							Bartlett Hall (Fine Arts) <br />
							Village A <br />
							Village B <br />
							Hardin ng Do�a Aurora Walk - UP Housing <br />
							Kamagong Residence Hall <br />
							Engineering Centennial Dorm <br />
							Barangay Krus Na Ligas <br />
							Credit Union <br />
							National Institute of Geological Sciences (NIGS) <br />
							Alumni Engineers Centennial Building (Engineering Library 2 / DCS)<br />
							College of Science Library and Administration Bldg. (CSLab)
							Electrical & Electronics Engineering Bldg. 1&2<br />
							Marine Science Institute (MSI)<br />
							Science Teacher Training Center<br />
							Natural Sciences Research Institute (NSRI) Miranda Hall (College Of Science)<br />
							Vidal Tan Hall (NISMED)<br />
							ITDC<br />
							Palma Hall (AS) <br />
							Pavilion 1 - Institute of Chemistry <br />
							Pavilion 2 - Institute of Physics <br />
							Casaa Food Center <br />
							Kamia Residence Hall <br />
							Pavilion 3 - Institute of Biology <br />
							Sampaguita Residence Hall <br />
							Zoology Building <br />
							CHE Craft And Design Laboratory (CDL) <br />
							UP Integrated School (UPIS) <br />
							Solidor Hall<br />
							Benton Hall<br />
							Benitez Hall (Education)<br />
							Vinzons Hall<br />
							College of Business Administration<br />
							School of Economics<br />
							Malcolm Hall (Law)<br />
							Romulo Hall (Asian Center & Institute of Islamic Studies)<br />
							Bocobo Hall (Law Library)<br />
							Mang Laris (Isaw place)<br />
							International Center<br />
							Swimming Pool<br />
							Ilang-Ilang Residence Hall<br />
							UP Health Service<br />
							Parish of The Holy Sacrifice<br />
							Church of the Risen Lord<br />
							Shopping Center (SC)<br />
							Cooperative Grocery<br />
							Area 2<br />
							UP Post Office<br />
							Kalayaan Residence Hall<br />
							Yakal Residence Hall <br />
							Molave Residence Hall<br />
							UP Employees Housing Cooperative (UPEHCO)<br />
							Film Institute <br />
							Ang Bahay ng Alumni (TBA)<br />
							Fonacier Hall (Alumni Center)<br />
							College of Music Annex<br />
							UP Center For Women's Studies<br />							
							College of Social Work & Community Development Complex<br />
							Archery Range<br />
							DMST Complex (SURP/Rappel Tower)<br />
							CHK Gym<br />
							School of Urban and Regional Planning (SURP)<br />
							Bonifacio Hall - School of Labor and Industrial Relation (SOLAIR)<br />
							
						</div>
						
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-toki" onclick="tokiRoute();">UP Toki</a>
							<a href="#toki-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						
						</div>
						
						<div id="toki-route-places" class="jeepney-and-places hidden">
							Virata Hall - Institute of Small Scale Industries (ISSI) <br />
							Bonifacio Hall - School of Labor and Industrial Relation (SOLAIR)<br />
							School of Urban and Regional Planning (SURP)<br />
							CHK Gym<br />
							DMST Complex (SURP/Rappel Tower)<br />
							Archery Range<br />
							College of Social Work & Community Development Complex<br />
							UP Center For Women's Studies<br />
							Alberto Hall - College of Music<br />
							Dance Studio<br />
							Plaridel Hall - Mass Communication<br />
							Quezon Hall - Oble<br />
							Vargas Musuem<br />
							Faculty Center<br />
							Palma Hall(AS)<br />
							Melchor Hall - College of Enggineering<br />
							Tennis Court<br />
							UP Employees Housing Cooperative (UPEHCO)<br />
							Molave Residence Hall<br />
							Yakal Residence Hall <br />
							UP Post Office<br />
							Area 2<br />
							Shopping Center (SC)<br />
							Cooperative Grocery<br />
							Kalayaan Residence Hall<br />
							Parish of The Holy Sacrifice<br />
							Church of the Risen Lord<br />
							UP Health Service<br />
							Ilang-Ilang Residence Hall<br />
							Swimming Pool<br />
							International Center<br />
							Isaw Place<br />
							Bocobo Hall (Law Library)<br />
							Romulo Hall (Asian Center & Institute of Islamic Studies)<br />
							Malcolm Hall (Law)<br />
							National Engineering Center<br />
							Benton Hall (FAN)<br />
							Solidor Hall<br />
							Benitez Hall (Education)<br />
							Vinzons Hall<br />
							Lorena Barros Hall<br />
							Narra Residence Hall<br />
							CSSP Faculty Building<br />
							UP Integrated School (UPIS)<br />
							Alonso Hall (Home Economics Complex)<br />
							Proposed NIMBB (College of Science)<br />
							Weather Bureau (Pagasa)<br />
							Institute of Chemistry Building (College of Science)<br />
							National Inst. of Physics (NIP) Bldg<br />
							UP Technology Park (Technology Business Incubator)<br />
							Advanced Science & Technology Institute (ASTI) Bldg.<br />
							Institute of Mathematics Bldg. (College of Science)<br />
							National Institute of Geological Sciences (NIGS)<br />
							Alumni Engineers Centennial Building (Engineering Library 2 / DCS)<br />
							College of Science Library and Administration Bldg. (CSLab)
							Electrical & Electronics Engineering Bldg. 1&2<br />
							Marine Science Institute (MSI)<br />
							Science Teacher Training Center<br />
							Natural Sciences Research Institute (NSRI) Miranda Hall (College Of Science)<br />
							Vidal Tan Hall (NISMED)<br />
							ITDC<br />
							Office of the University Registrar & Office of Admissions (OUR)<br />
							PAUW Day Care / Children's Playground<br />
							College of Architecture Bldg 1 & 2<br />
							University Police/ Fire Department<br />
							University Press<br />
							Coral Bldg. Office of Campus Architect (OCA)<br />
							Villadolid Hall (Archaeological Studies Program)<br />
							Albert Hall<br />
							Seaweed Building (MBB)<br />
							Supply and Property Management Office (SPMO Diliman)<br />
							New LRT<br />
						</div>
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-katip" onclick="katipRoute();">Katipunan-UP</a>
							<a href="#katip-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						</div>
						
						<div id="katip-route-places" class="jeepney-and-places hidden">
							GT Toyota - Asian Center Building<br />
							Romulo Hall (Asian Center & Institute of Islamic Studies)<br />
							Bocobo Hall (Law Library)<br />
							Mang Laris (Isaw place)<br />
							International Center<br />
							Swimming Pool<br />
							Ilang-Ilang Residence Hall<br />
							UP Health Service<br />
							Parish of The Holy Sacrifice<br />
							Church of the Risen Lord<br />
							Shopping Center (SC)<br />
							Cooperative Grocery<br />
							Area 2<br />
							UP Post Office<br />
							Kalayaan Residence Hall<br />
							Yakal Residence Hall <br />
							Molave Residence Hall<br />
							UP Employees Housing Cooperative (UPEHCO)<br />
							Film Institute <br />
							Ang Bahay ng Alumni (TBA)<br />
							Fonacier Hall (Alumni Center)<br />
							College of Music Annex<br />
							UP Center For Women's Studies<br />
							Alberto Hall - College of Music<br />
							Dance Studio<br />
							Plaridel Hall - Mass Communication<br />
							Quezon Hall - Oble<br />
							Vargas Musuem<br />
							Faculty Center<br />
							Palma Hall(AS)<br />
							Benton Hall (FAN)<br />
							Solidor Hall<br />
							Benitez Hall (Education)<br />
							Vinzons Hall<br />
							College of Business Administration<br />
							School of Economics<br />
							Malcolm Hall (Law)<br />
						</div>
						
						<div class="jeepney-toggle-wrapper">
							<a class="btn-route btn-philcoa" onclick="philcRoute();">Philcoa-UP</a>
							<a href="#philcoa-route-places" class="jeepney-places-button fa fa-angle-down"></a>
						</div>
						
						<div id="philcoa-route-places" class="jeepney-and-places hidden">
							Quezon Hall - Oble<br />
							Vargas Musuem<br />
							Faculty Center<br />
							Palma Hall(AS)<br />
							Benton Hall (FAN)<br />
							Solidor Hall<br />
							Benitez Hall (Education)<br />
							Vinzons Hall<br />
							College of Business Administration<br />
							School of Economics<br />
							Malcolm Hall (Law)<br />
							Romulo Hall (Asian Center & Institute of Islamic Studies)<br />
							Bocobo Hall (Law Library)<br />
							Mang Laris (Isaw place)<br />
							International Center<br />
							Swimming Pool<br />
							Ilang-Ilang Residence Hall<br />
							UP Health Service<br />
							Parish of The Holy Sacrifice<br />
							Church of the Risen Lord<br />
							Shopping Center (SC)<br />
							Cooperative Grocery<br />
							Area 2<br />
							UP Post Office<br />
							Kalayaan Residence Hall<br />
							Yakal Residence Hall <br />
							Molave Residence Hall<br />
							UP Employees Housing Cooperative (UPEHCO)<br />
							Tennis Court<br />
							Melchor Hall - College of Enggineering<br />
							Carillon (Andres Bonifacio Centennial Hall)<br />
							Villamor Hall (UP Theater)<br />
							Abelardo Hall (Music)<br />
							Plaridel Hall (Mass Communication)<br />
							UP Wet Market <br />
							UP - Ayala Techno Hub <br />
							
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
	  			
	  			
	  			
				  <ol id="joyRideTipContent">
			   
			      <li data-id="welcome" data-button="Next" data-options="tipLocation:right;tipAnimation:fade">
			        <h2>Welcome to UP MAP!</h2>
			        <p>An online map of the University of the Philippines Diliman
			        	that aims to help people find their way around the campus!</p>
			      </li>
			      
			      <li data-id="map-wrapper" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Google Map</h2>
			        <p>With an embedded Google Map. Finding roads, buildings and waypoints
			        	are a piece of cake!</p>
			      </li>
			
				  <li data-id="nav" data-button="Next" data-options="tipLocation:bottom;tipAnimation:fade">
			        <h2>Quick Navigation</h2>
			        <p>Easy On-Click way to navigate through the many useful functions
			        	in the site.</p>
			      </li>
			      
			      <li data-id="welcome" data-button="Next" data-options="tipLocation:right;tipAnimation:fade">
			        <h2>Quick Navigation</h2>
			        <p>Easy On-Click way to navigate through the many useful functions
			        	in the site.</p>
			      </li>
			      
			      <li data-id="searchForm" data-button="Next" data-options="tipLocation:right;tipAnimation:fade">
			        <h2>Quick Search</h2>
			        <p>Need to search for a building? Search it here to pinpoint it in the Google Map.</p>
			        <p>Choose a Category to filter your results.</p>
			      </li>
			      
			      <li data-id="menu" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Menu</h2>
			        <p>Try out our different functions that will help you on your UP Map
			        	experience!</p>
			      </li>
			      
			      <li data-id="buttonPlace" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>My Places</h2>
			        <p>View your favorite places and recent searches here!</p>
			      </li>
			      
			      <li data-id="buttonDirect" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Get Direction</h2>
			        <p>Need to find a route from here to there? Try out our Route Finding!</p>
			      </li>
			      
			      <li data-id="buttonRoute" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Jeepney</h2>
			        <p>Find which buildings, the jeeps in UPD passes by.</p>
			      </li>
			      
			      <li data-id="buttonTrivia" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Trivia</h2>
			        <p>Browse through random interesting facts about U.P.D.</p>
			      </li>
			      
			      <li data-id="buttonScreen" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Screenshot</h2>
			        <p>Grab a Screenshot of the current view of the Map</p>
			      </li>
			      
			      <li data-id="buttonWeather" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Weather</h2>
			        <p>How's the weather up there?</p>
			      </li>
			      
			      <li data-id="buttonHelp" data-button="Next" data-options="tipLocation:left;tipAnimation:fade">
			        <h2>Help</h2>
			        <p>This is what you clicked.</p>
			      </li>
			      
			      <li data-button="End">
			        <h2>The End</h2>
			        <p>Hope this helps!</p>
			        <p>Enjoy!</p>
			        
			      </li>
			    </ol>
  			
	  			
	  			
	  			
	  		
  		</div>

	<div id="map-wrapper">
	

		<div id="map-canvas" >
    	</div>
		
  		
  
    	
    	
    
    </div>
    <!-- end of map wrapper -->
    </div>

    
  </body>
</html>


