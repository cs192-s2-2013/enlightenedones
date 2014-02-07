package com.goup.dao;

/**
*
* @author Andie Rabino
*
*/

//import java.util.ArrayList;
//import java.util.List;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.jdbc.core.JdbcTemplate;

import com.goup.domain.Place; 
import com.goup.jdbc.PlaceRowMapper; 

public class PlaceDaoImpl implements PlaceDao {
	
	@Autowired  
	DataSource dataSource;
	
	public void insertData(Place place){
		String sql = "INSERT INTO place" + "(place_name,place_lat,place_long)" +
				"VALUES (? ,? ,?)";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		jdbcTemplate.update(
				sql,
				new Object[] {place.getPlaceName(), place.getPlaceLat(), place.getPlaceLong() });
				
	}
	
	public Place searchPlaceByName(String placeName){
		List<Place> placeList = new ArrayList<Place>();
		String sql = "select * from place where place_name= \"" + placeName +"\"";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		if(placeList.size()>0)
			return placeList.get(0);
		
		sql = "select * from place where place_name Like '%"+placeName+ "%'";
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		
		if(placeList.size()>0)
			return placeList.get(0);
		else
			return null;
	}
	
	
	
}