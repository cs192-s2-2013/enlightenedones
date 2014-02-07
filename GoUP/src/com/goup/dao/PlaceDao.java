package com.goup.dao;
/**
 *
 * @author Andie Rabino
 *
 */

//import java.util.List;
import com.goup.domain.Place;
import java.util.*;

public interface PlaceDao {
	
	public void insertData(Place place);
	public List<Place> searchPlaceByName(String placeName);
	
}