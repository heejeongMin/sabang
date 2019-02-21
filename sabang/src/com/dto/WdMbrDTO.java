package com.dto;

public class WdMbrDTO {

	private String userid;
	private String droptime;
	public WdMbrDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WdMbrDTO(String userid, String droptime) {
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