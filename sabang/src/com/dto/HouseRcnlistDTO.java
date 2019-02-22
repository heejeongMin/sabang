package com.dto;

public class HouseRcnlistDTO {
	private Long num;
	private String userid;
	private String gCode;
	
	
	public HouseRcnlistDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HouseRcnlistDTO(Long num, String userid, String gCode) {
		super();
		this.num = num;
		this.userid = userid;
		this.gCode = gCode;
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


	public String getgCode() {
		return gCode;
	}


	public void setgCode(String gCode) {
		this.gCode = gCode;
	}


	@Override
	public String toString() {
		return "RcnlistDTO [num=" + num + ", userid=" + userid + ", gCode=" + gCode + "]";
	}
}
