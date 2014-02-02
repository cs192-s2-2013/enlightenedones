package com.goup.services;


//import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;  
import com.goup.dao.PlaceDao;  
import com.goup.domain.Place;

public class PlaceServiceImpl implements PlaceService { 
	
	@Autowired
	PlaceDao placedao;
	
	@Override  
	 public void insertData(Place place) {  
	  placedao.insertData(place);  
	 }  
	
	@Override
	public Place searchPlaceByName(String placeName){
		return placedao.searchPlaceByName(placeName);
	}
}

