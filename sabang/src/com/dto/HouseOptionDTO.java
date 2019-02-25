package com.dto;

public class HouseOptionDTO {
	private String hcode;
	private char bltin;
	private char elev;
	private char pet;
	private char vrd;
	private char loan;
	private char park;
	private char mdate;
	private String etc;
	
	public HouseOptionDTO() { }
	public HouseOptionDTO(String hcode, char bltin, char elev, char pet, char vrd, char loan, char park, char mdate,
			String etc) {
		this.hcode = hcode;
		this.bltin = bltin;
		this.elev = elev;
		this.pet = pet;
		this.vrd = vrd;
		this.loan = loan;
		this.park = park;
		this.mdate = mdate;
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "HouseOptionDTO [hcode=" + hcode + ", bltin=" + bltin + ", elev=" + elev + ", pet=" + pet + ", vrd="
				+ vrd + ", loan=" + loan + ", park=" + park + ", mdate=" + mdate + ", etc=" + etc + "]";
	}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
	public char getBltin() {
		return bltin;
	}
	public void setBltin(char bltin) {
		this.bltin = bltin;
	}
	public char getElev() {
		return elev;
	}
	public void setElev(char elev) {
		this.elev = elev;
	}
	public char getPet() {
		return pet;
	}
	public void setPet(char pet) {
		this.pet = pet;
	}
	public char getVrd() {
		return vrd;
	}
	public void setVrd(char vrd) {
		this.vrd = vrd;
	}
	public char getLoan() {
		return loan;
	}
	public void setLoan(char loan) {
		this.loan = loan;
	}
	public char getPark() {
		return park;
	}
	public void setPark(char park) {
		this.park = park;
	}
	public char getMdate() {
		return mdate;
	}
	public void setMdate(char mdate) {
		this.mdate = mdate;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
}
