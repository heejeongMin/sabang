package com.dto;

public class wdMbrDTO {

	private String userid;
	private String droptime;
	public wdMbrDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public wdMbrDTO(String userid, String droptime) {
		super();
		this.userid = userid;
		this.droptime = droptime;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getDroptime() {
		return droptime;
	}
	public void setDroptime(String droptime) {
		this.droptime = droptime;
	}
	@Override
	public String toString() {
		return "wdMbrDTO [userid=" + userid + ", droptime=" + droptime + "]";
	}
}	