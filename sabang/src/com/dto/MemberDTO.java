package com.dto;

public class MemberDTO {
	
	private String userid;
	private String passwd;
	private String ssn;
	private String username;
	private String post;
	private String addr;
	private String phone;
	private String email;
	private char agent;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String userid, String passwd, String phone) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.phone = phone;
	}
	

	public MemberDTO(String userid, String passwd, String ssn, String username, String post, String addr, String phone,
			String email, char agent) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.ssn = ssn;
		this.username = username;
		this.post = post;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.agent = agent;
	}
	public MemberDTO(String userid, String passwd, String ssn, String username, String post, String addr, String phone,
			String email) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.ssn = ssn;
		this.username = username;
		this.post = post;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
	}

	
	
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getAgent() {
		return agent;
	}
	public void setAgent(char agent) {
		this.agent = agent;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", ssn=" + ssn + ", username=" + username
				+ ", post=" + post + ", addr=" + addr + ", phone=" + phone + ", email=" + email + ", agent=" + agent
				+ "]";
	}

	
	
	
	
	
}
