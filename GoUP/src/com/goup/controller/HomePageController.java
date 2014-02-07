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

import com.goup.domain.Place;  
import com.goup.services.PlaceService;

@Controller
public class HomePageController {
	
	@Autowired
	PlaceService placeService;
	String success = null; 
	
	@RequestMapping("/home")
	public ModelAndView home(@ModelAttribute Place place){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message",success);
		modelAndView.setViewName("home");
		this.success=null;
		return modelAndView;
	}

	
	
	
	@RequestMapping("/insertPlace")  
	public String inserData(@ModelAttribute Place place) {  
		if (place != null){
			placeService.insertData(place); 
			this.success = "Succesfully added the place, " + place.getPlaceName();
		}
			 
		return "redirect:/home";  
	}  
	
	@RequestMapping(value="/findPlace",method=RequestMethod.GET )
	public @ResponseBody String getData(@RequestParam(value = "placeName") String placeName) {  
		
		ObjectMapper mapper = new ObjectMapper();
		List<Place> place = null;
		place = placeService.searchPlaceByName(placeName);
		
		if(place==null){
			return null;
		}else{
			String json= "";
			String test = "";
			try {
				//test = mapper.writeValueAsString(place);
				json = mapper.writeValueAsString(place);
			} catch (JsonGenerationException e) {
			       e.printStackTrace();
		    } catch (JsonMappingException e) {
		       e.printStackTrace();
		    } catch (IOException e) {
		       e.printStackTrace();
		    }
			//System.out.println(test);
			return json;
			
			
		}
		
		 
	} 
}