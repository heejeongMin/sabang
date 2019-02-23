package com.dto;

public class AgentDTO {

	private String agntid;
	private String passwd;
	private String agntssn;
	private String agntname;
	private String agntphone;
	private String agntemail;
	private String hcode;
	public AgentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AgentDTO(String agntid, String passwd, String agntphone) {
		super();
		this.agntid = agntid;
		this.passwd = passwd;
		this.agntphone = agntphone;
	}


	public AgentDTO(String agntid, String passwd, String agntssn, String agntname, String agntphone, String agntemail,
			String hcode) {
		super();
		this.agntid = agntid;
		this.passwd = passwd;
		this.agntssn = agntssn;
		this.agntname = agntname;
		this.agntphone = agntphone;
		this.agntemail = agntemail;
		this.hcode = hcode;
	}
	public AgentDTO(String agntid, String passwd, String agntssn, String agntname, String agntphone, String agntemail) {
		super();
		this.agntid = agntid;
		this.passwd = passwd;
		this.agntssn = agntssn;
		this.agntname = agntname;
		this.agntphone = agntphone;
		this.agntemail = agntemail;
	}
	public String getAgntid() {
		return agntid;
	}
	public void setAgntid(String agntid) {
		this.agntid = agntid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getAgntssn() {
		return agntssn;
	}
	public void setAgntssn(String agntssn) {
		this.agntssn = agntssn;
	}
	public String getAgntname() {
		return agntname;
	}
	public void setAgntname(String agntname) {
		this.agntname = agntname;
	}
	public String getAgntphone() {
		return agntphone;
	}
	public void setAgntphone(String agntphone) {
		this.agntphone = agntphone;
	}
	public String getAgntemail() {
		return agntemail;
	}
	public void setAgntemail(String agntemail) {
		this.agntemail = agntemail;
	}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
	@Override
	public String toString() {
		return "AgentDTO [agntid=" + agntid + ", passwd=" + passwd + ", agntssn=" + agntssn + ", agntname=" + agntname
				+ ", agntphone=" + agntphone + ", agntemail=" + agntemail + ", hcode=" + hcode + "]";
	}
	
	
	
	
	
}
