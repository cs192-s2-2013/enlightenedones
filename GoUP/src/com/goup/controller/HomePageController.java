package com.goup.controller;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
//import java.util.ArrayList;  
//import java.util.HashMap;  
//import java.util.List;  
//import java.util.Map;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;  

import com.goup.domain.MyPlace;
import com.goup.domain.Place;
import com.goup.domain.Category;
import com.goup.services.CategoryService;
import com.goup.services.MyPlaceService;
import com.goup.services.PlaceService;

@Controller
public class HomePageController {
	
	@Autowired
	PlaceService placeService;
	
	@Autowired
	MyPlaceService myPlaceService;
	
	@Autowired
	CategoryService categoryService;
	
	String success = null; 
	
	
	@RequestMapping("/home")
	public ModelAndView home(@ModelAttribute Place place){
		ModelAndView modelAndView = new ModelAndView();
			
		modelAndView.addObject("message",success);
		modelAndView.setViewName("home");
		this.success=null;
		return modelAndView;
	}

	@RequestMapping("/getCategories")
	public @ResponseBody String getCategories(){
		
		ObjectMapper mapper = new ObjectMapper();
		List<Category> categoryList = null;
		categoryList = categoryService.getCategories(); 
		
		if(categoryList==null){
			return null;
		}else{
			String json= "";
			try {
				
				json = mapper.writeValueAsString(categoryList);
			} catch (JsonGenerationException e) {
			       e.printStackTrace();
		    } catch (JsonMappingException e) {
		       e.printStackTrace();
		    } catch (IOException e) {
		       e.printStackTrace();
		    }
			return json;
			
			
		}
	}
	
	
	@RequestMapping(value="/findPlace",method=RequestMethod.GET )
	public @ResponseBody String getPlaceByName(@RequestParam(value = "placeName") String placeName) {  
		
		ObjectMapper mapper = new ObjectMapper();
		List<Place> placelist = null;
		placelist = placeService.searchPlaceByName(placeName);
		
		if(placelist==null){
			return null;
		}else{
			String json= "";
			try {
				
				json = mapper.writeValueAsString(placelist);
			} catch (JsonGenerationException e) {
			       e.printStackTrace();
		    } catch (JsonMappingException e) {
		       e.printStackTrace();
		    } catch (IOException e) {
		       e.printStackTrace();
		    }
			return json;
			
			
		}
		
		 
	} 
	
	@RequestMapping(value="/findPlaceByCategory",method=RequestMethod.GET )
	public @ResponseBody String getPlaceByCategory(@RequestParam(value = "category") String category) {  
		
		ObjectMapper mapper = new ObjectMapper();
		List<Place> placelist = null;
		placelist = placeService.searchPlaceByCategory(category);
		
		if(placelist==null){
			return null;
		}else{
			String json= "";
			try {
				json = mapper.writeValueAsString(placelist);
			} catch (JsonGenerationException e) {
			       e.printStackTrace();
		    } catch (JsonMappingException e) {
		       e.printStackTrace();
		    } catch (IOException e) {
		       e.printStackTrace();
		    }
			return json;
			
			
		}
		
		 
	} 
	
	@RequestMapping(value="/findPlaceByCategoryAndName",method=RequestMethod.GET )
	public @ResponseBody String getPlaceByCategoryAndName(@RequestParam(value = "category") String category,
			@RequestParam(value ="placeName") String placeName) {  
		
		ObjectMapper mapper = new ObjectMapper();
		List<Place> placelist = null;
		placelist = placeService.searchPlaceByCategoryAndName(category,placeName);
		
		if(placelist==null){
			return null;
		}else{
			String json= "";
			try {
				json = mapper.writeValueAsString(placelist);


			} catch (JsonGenerationException e) {
			       e.printStackTrace();
		    } catch (JsonMappingException e) {
		       e.printStackTrace();
		    } catch (IOException e) {
		       e.printStackTrace();
		    }
			return json;
			
		}

	}

		 
	
	
	@RequestMapping(value="/getMyPlaces", method=RequestMethod.GET)
	public @ResponseBody String getMyPlaces(@RequestParam(value="userId") String userId){
		ObjectMapper mapper = new ObjectMapper();
		List<MyPlace> myPlaceList = null;
		myPlaceList = myPlaceService.getMyPlaces(userId);
		if(myPlaceList==null){
			String json="error";
			return json;
		}else{
			String json="";
			
			try {
				json = mapper.writeValueAsString(myPlaceList);
				

			} catch (JsonGenerationException e) {
			       e.printStackTrace();
		    } catch (JsonMappingException e) {
		       e.printStackTrace();
		    } catch (IOException e) {
		       e.printStackTrace();
		    }
			return json;
			
		}
	}
	
	@RequestMapping("/insertMyPlace")  
	public @ResponseBody void insertMyPlace(@RequestParam(value = "userId") String userId,
			@RequestParam(value ="placeId") String placeId) {
		MyPlace myPlace = new MyPlace();
		myPlace.setUserId(userId);
		myPlace.setPlaceId(Integer.parseInt(placeId));
		if (myPlace != null){
			myPlaceService.insertData(myPlace); 
		}
	}  
	
	@RequestMapping("/removeMyPlace")  
	public @ResponseBody void removeMyPlace(@RequestParam(value = "userId") String userId,
			@RequestParam(value ="placeId") String placeId) {
		MyPlace myPlace = new MyPlace();
		myPlace.setUserId(userId);
		myPlace.setPlaceId(Integer.parseInt(placeId));
		if (myPlace != null){
			myPlaceService.deleteData(myPlace); 
		}
	}  
	
	@RequestMapping("/getPlacesPassedByJeepney")
	public @ResponseBody String getPlacesPassedByJeepney() throws JsonGenerationException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		List<List<Place>> placeList= new ArrayList<List<Place>>();
		placeList = placeService.getPlacesPassedByJeepney(); 
		String json = mapper.writeValueAsString(placeList);
		
		if (placeList!=null){
			return json;
		}else{
			return null;
		}
		
	}
	
	@RequestMapping("/getJeepneysToPlace")
	public @ResponseBody String getJeepneysToPlace(@RequestParam(value = "placeId") String placeId) throws JsonGenerationException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		List<String> placeList= new ArrayList<String>();
		placeList = placeService.getJeepneysToPlace(placeId);
		String json;
		
		if (placeList.size()>0){
			json = mapper.writeValueAsString(placeList);
			return json;
		}else{
			return null;
		}
		
	}
	
}