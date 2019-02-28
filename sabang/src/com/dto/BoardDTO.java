package com.dto;

public class BoardDTO {
	private String userid;
	private String pcode;
	private String pdate;
	private String ppwd;
	private String title;
	private String content;
	private String filename;
	private String hcode;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(String userid, String pcode, String pdate, String ppwd, String title, String content,
			String filename, String hcode) {
		super();
		this.userid = userid;
		this.pcode = pcode;
		this.pdate = pdate;
		this.ppwd = ppwd;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.hcode = hcode;
	}
	
	public BoardDTO( String pcode, String title, String content) {
		this.pcode = pcode;
		this.title = title;
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "BoardDTO [userid=" + userid + ", pcode=" + pcode + ", pdate=" + pdate + ", ppwd=" + ppwd + ", title="
				+ title + ", content=" + content + ", filename=" + filename + ", hcode=" + hcode + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPpwd() {
		return ppwd;
	}
	public void setPpwd(String ppwd) {
		this.ppwd = ppwd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
}