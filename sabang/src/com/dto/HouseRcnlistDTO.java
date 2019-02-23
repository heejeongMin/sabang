package com.dto;

public class HouseRcnlistDTO {
	private Long num;
	private String userid;
	private String hcode;
	
	
	public HouseRcnlistDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HouseRcnlistDTO(Long num, String userid, String hcode) {
		super();
		this.num = num;
		this.userid = userid;
		this.hcode = hcode;
	}


	public Long getnum() {
		return num;
	}


	public void setnum(Long num) {
		this.num = num;
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


	public void setHcode(String gCode) {
		this.hcode = gCode;
	}


	@Override
	public String toString() {
		return "RcnlistDTO [num=" + num + ", userid=" + userid + ", hcode=" + hcode + "]";
	}
}
