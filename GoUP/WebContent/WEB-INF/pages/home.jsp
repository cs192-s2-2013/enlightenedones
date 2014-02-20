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
  
    <!--End Including JS Plugins-->
 	
 
        
    <script type="text/javascript">
    	//calcRoute("14.6542240000,121.0734100000", "14.6598450000,121.0709850000"); // calling function from here
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
    
  </head>
  <body>

	<!-- begin of map-wrapper -->
	<div id="side-box" class="col-md-3">
		
			<div class="side-box-header">
				<div id="goup-logo" class="circle logo">
		    	</div>
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
	  	
	  					<select id="categorySelect" onchange="categoryOnChange();">
	  						<option value="">Select a category</option>
	  						<option value="AAS">Administration and Support</option>
	  						<option value="CSSP">College of Social Science and Philosophy</option>
	  						<option value="DORMS">Dormitories</option>
	  						
	  					</select>
	  					
	  					<input id="searchPlaceName" placeholder="Type the name of the place" type="text" class="form-control" onKeyUp="if (event.keyCode == 13) searchPlaceEnter();"/>
	  				
	  					<input id="searchButton" class="btn btn-primary" type="button" value="Search" onclick="searchPlaceClick();" />
	  				
	  			</form>
	  			
	  			<form id="findPath" onkeypress="return event.keyCode != 13;">
	  				<h3>Find Path</h3>
	  				<input id="searchOriginPlaceName" placeholder="Where are you now?" type="text" class="form-control"/>
	  				<input id="searchDestinationPlaceName" placeholder="Where are you going?" type="text" class="form-control"/>
	  				<input id="searchButton" class="btn btn-primary" type="button" value="Crawl" onclick="path();" />
	  			</form>
	  			
	  			<div id="results">
	  			
	  			</div>
	  	
	  			
	  			<form id="route1" >
	  				<h3>Jeepney Routes</h3>
	  				<table>
	  									 					
	  					<tr>
						<td></td>
						<td><input class="btn btn-ikot btn-route" type="button" value="UP Ikot" onclick="ikotRoute();" /></td>
						<td><input class="btn btn-toki btn-route" type="button" value="UP Toki" onclick="tokiRoute();" /></td>
						</tr>
						<tr>
						<td></td>
						<td><input class="btn btn-danger btn-route" type="button" value="Katipunan-UP" onclick="katipRoute();" /></td>
						<td><input class="btn btn-success btn-route" type="button" value="Philcoa-UP" onclick="philcRoute();" /></td>
						</tr> <tr> <td></td>
						<td><input class="btn btn-primary btn-route" type="button" value="ALL" onclick="allRoute();" /></td>
						
						</tr>
	  					
	  				</table>
	  			</form>
	  			
	  			
	  		</div>
  		</div>

	<div id="map-wrapper" class="col-md-9">
	

		<div id="map-canvas" >
    	</div>
		
  		
  
    	
    	
    
    </div>
    <!-- end of map wrapper -->
    

    
  </body>
</html>


