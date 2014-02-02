package com.goup.dao;
/**
 *
 * @author Andie Rabino
 *
 */

//import java.util.List;
import com.goup.domain.Place;

public interface PlaceDao {
	
	public void insertData(Place place);
	public Place searchPlaceByName(String placeName);
	
}