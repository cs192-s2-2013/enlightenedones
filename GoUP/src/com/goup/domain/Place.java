package com.goup.domain;

public class Place {
	
	private String placeName;
	private double placeLat;
	private double placeLong;
	
	public String getPlaceName(){
		return placeName;
	}
	
	public void setPlaceName(String placeName){
		this.placeName = placeName;
	}
	
	public double getPlaceLat(){
		return placeLat;
	}
	
	public void setPlaceLat(double placeLat){
		this.placeLat = placeLat;
	}
	
	public double getPlaceLong(){
		return placeLong;
	}
	
	public void setPlaceLong(double placeLong){
		this.placeLong = placeLong;
	}
	
}