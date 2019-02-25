package com.dto;

public class BoardDTO {
	
	private String pcode;
	private String pdate;
	private String ppwd;
	private String phone;
	private String title;
	private String content;
	private String filename;
	private String hcode;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardDTO(String pcode, String pdate, String ppwd, String phone, String title, String content,
			String filename, String hcode) {
		super();
		this.pcode = pcode;
		this.pdate = pdate;
		this.ppwd = ppwd;
		this.phone = phone;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.hcode = hcode;
	}
	
	public BoardDTO(String pcode, String pdate, String ppwd, String phone, String title, String content,
		 String hcode) {
		super();
		this.pcode = pcode;
		this.pdate = pdate;
		this.ppwd = ppwd;
		this.phone = phone;
		this.title = title;
		this.content = content;
		this.hcode = hcode;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	@Override
	public String toString() {
		return "BoardDTO [pcode=" + pcode + ", pdate=" + pdate + ", ppwd=" + ppwd + ", phone=" + phone + ", title="
				+ title + ", content=" + content + ", filename=" + filename + ", hcode=" + hcode + "]";
	}
	
	
	
}
