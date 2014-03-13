package com.goup.dao;


import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.jdbc.core.JdbcTemplate;

import com.goup.domain.Category;
import com.goup.jdbc.CategoryRowMapper; 

public class CategoryDaoImpl implements CategoryDao {
	
	@Autowired  
	DataSource dataSource;

	@Override
	public List<Category> getCategories() {
		List<Category> categoryList = new ArrayList<Category>();
		String sql = "Select * from categories order by category_name";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		categoryList = jdbcTemplate.query(sql, new CategoryRowMapper());
		
		if(categoryList.size()>0)
			return categoryList;
	
		else
			return null;
		
	}
	
	
	
	
}
