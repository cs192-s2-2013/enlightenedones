package com.goup.services;

import java.util.List;

//import java.util.List;
import com.goup.domain.Place;

public interface PlaceService {
	
	public void insertData(Place place);
	public List<Place> searchPlaceByName(String placeName);
}