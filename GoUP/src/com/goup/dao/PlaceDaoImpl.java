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

import com.goup.domain.MyPlace;
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
	
	public List<Place> searchPlaceByName(String placeName){
		List<Place> placeList = new ArrayList<Place>();
		String sql = "select * from place join categories on place.place_category=categories.category_id where place_name like \"%"+placeName+"%\"";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		if(placeList.size()>0)
			return placeList;
		else
			return null;
		
	}
	
	public List<Place> searchPlaceByCategory(String category){
		
		List<Place> placeList = new ArrayList<Place>();
		String sql = "select * from place join categories on place.place_category=categories.category_id where place_category like \"%" + category +"%\"";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		
		if(placeList.size()>0)
			return placeList;
	
		else
			return null;
		
	}
	
	
	public List<Place> searchPlaceByCategoryAndName(String category, String placeName){
		
		List<Place> placeList = new ArrayList<Place>();
		String sql = "select * from place join categories on place.place_category=categories.category_id where place_category like \"%" + category +"%\" " +
				"and (place_name like \"%" + placeName +"%\" or place_category like \"%" +placeName + 
				"%\" or place_category in (select category_id from categories" +
				" where category_name like \"%" + placeName +"%\"))";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		
		if(placeList.size()>0)
			return placeList;
	
		else
			return null;
		
	}
	
	public List<List<Place>> getPlacesPassedByJeepney(){
		
		List<List<Place>> placeList = new ArrayList<List<Place>>(4);
		String sql;
		JdbcTemplate jdbcTemplate;
		
		List<Place> ikotBldgList = new ArrayList<Place>();
		
		sql = "select * from place join categories join routeKatipunan on place.place_category=categories.category_id and place.place_id=routeKatipunan.place_id order by routeKatipunan.route_index";
		jdbcTemplate = new JdbcTemplate(dataSource);
		ikotBldgList = jdbcTemplate.query(sql, new PlaceRowMapper());
		
		placeList.add(ikotBldgList);
		
	
		return placeList;
	
	}
	
	public List<String> getJeepneysToPlace(String placeId){
		List<String> jeepneyList = new ArrayList<String>();
		List<Place> placeList;
		String sql;
		JdbcTemplate jdbcTemplate;
		
		//Check if passed by ikot jeep
		sql = "select * from place join categories join routeIkot on place.place_category=categories.category_id and place.place_id=routeIkot.place_id and place.place_id=" + placeId;
		jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = new ArrayList<Place>();
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		if(placeList.size()>0){
			jeepneyList.add("UP Ikot");
		}
		
		//Check if passed by toki jeep
		sql = "select * from place join categories join routeToki on place.place_category=categories.category_id and place.place_id=routeToki.place_id and place.place_id=" + placeId;
		jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = new ArrayList<Place>();
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		if(placeList.size()>0){
			jeepneyList.add("UP Toki");
		}
		
		//Check if passed by katipunan jeep
		sql = "select * from place join categories join routeKatipunan on place.place_category=categories.category_id and place.place_id=routeKatipunan.place_id and place.place_id=" + placeId;
		jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = new ArrayList<Place>();
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		if(placeList.size()>0){
			jeepneyList.add("Katipunan-UP");
		}
			
		//Check if passed by philcoa jeep
		sql = "select * from place join categories join routePhilcoa on place.place_category=categories.category_id and place.place_id=routePhilcoa.place_id and place.place_id=" + placeId;
		jdbcTemplate = new JdbcTemplate(dataSource);
		placeList = new ArrayList<Place>();
		placeList = jdbcTemplate.query(sql, new PlaceRowMapper());
		if(placeList.size()>0){
			jeepneyList.add("Philcoa-UP");
		}

		
		return jeepneyList;
	}
	

	
}