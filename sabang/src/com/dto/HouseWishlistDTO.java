package com.dto;

public class HouseWishlistDTO {
	private String userid;
	private String hcode;
	
	
	public HouseWishlistDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HouseWishlistDTO(String userid, String hcode) {
		super();
		this.userid = userid;
		this.hcode = hcode;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getHcode() {
		return hcode;
	}


	public void setHcode(String hcode) {
		this.hcode = hcode;
	}


	@Override
	public String toString() {
		return "HouseWishlistDTO [userid=" + userid + ", hcode=" + hcode + "]";
	}

}
