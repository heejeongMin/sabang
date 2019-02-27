package com.dto;

public class HouseInfoDTO {
	private String hcode;
	private String htype;
	private String rtype;
	private String hname;
	private String addr;
	private String coordX;
	private String coordY;
	private String area;
	private int whlflr;
	private int flr;
	private int room;
	private String batr;
	private int cntwish;
	private String himage;
	private String hetc;
	private String registerDate;
	private String agntid;
	
	public HouseInfoDTO() { }

	public HouseInfoDTO(String hcode, String htype, String rtype, String hname, String addr, String coordX,
			String coordY, String area, int whlflr, int flr, int room, String batr, int cntwish, String himage,
			String hetc, String registerDate, String agntid) {
		this.hcode = hcode;
		this.htype = htype;
		this.rtype = rtype;
		this.hname = hname;
		this.addr = addr;
		this.coordX = coordX;
		this.coordY = coordY;
		this.area = area;
		this.whlflr = whlflr;
		this.flr = flr;
		this.room = room;
		this.batr = batr;
		this.cntwish = cntwish;
		this.himage = himage;
		this.hetc = hetc;
		this.registerDate = registerDate;
		this.agntid = agntid;
	}

	
	@Override
	public String toString() {
		return "HouseInfoDTO [hcode=" + hcode + ", htype=" + htype + ", rtype=" + rtype + ", hname=" + hname + ", addr="
				+ addr + ", coordX=" + coordX + ", coordY=" + coordY + ", area=" + area + ", whlflr=" + whlflr
				+ ", flr=" + flr + ", room=" + room + ", batr=" + batr + ", cntwish=" + cntwish + ", himage=" + himage
				+ ", hetc=" + hetc + ", registerDate=" + registerDate + ", agntid=" + agntid + "]";
	}

	public String getHcode() {
		return hcode;
	}

	public void setHcode(String hcode) {
		this.hcode = hcode;
	}

	public String getHtype() {
		return htype;
	}

	public void setHtype(String htype) {
		this.htype = htype;
	}

	public String getRtype() {
		return rtype;
	}

	public void setRtype(String rtype) {
		this.rtype = rtype;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCoordX() {
		return coordX;
	}

	public void setCoordX(String coordX) {
		this.coordX = coordX;
	}

	public String getCoordY() {
		return coordY;
	}

	public void setCoordY(String coordY) {
		this.coordY = coordY;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getWhlflr() {
		return whlflr;
	}

	public void setWhlflr(int whlflr) {
		this.whlflr = whlflr;
	}

	public int getFlr() {
		return flr;
	}

	public void setFlr(int flr) {
		this.flr = flr;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getBatr() {
		return batr;
	}

	public void setBatr(String batr) {
		this.batr = batr;
	}

	public int getCntwish() {
		return cntwish;
	}

	public void setCntwish(int cntwish) {
		this.cntwish = cntwish;
	}

	public String getHimage() {
		return himage;
	}

	public void setHimage(String himage) {
		this.himage = himage;
	}

	public String getHetc() {
		return hetc;
	}

	public void setHetc(String hetc) {
		this.hetc = hetc;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getAgntid() {
		return agntid;
	}

	public void setAgntid(String agntid) {
		this.agntid = agntid;
	}
}
