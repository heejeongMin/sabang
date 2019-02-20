package com.dto;

public class HousePriceDTO {
	private String hcode;
	private int deposit;
	private int mrent;
	private int yrent;
	private int maintc;
	private double parkf;
	
	public HousePriceDTO() { }
	public HousePriceDTO(String hcode, int deposit, int mrent, int yrent, int maintc, double parkf) {
		this.hcode = hcode;
		this.deposit = deposit;
		this.mrent = mrent;
		this.yrent = yrent;
		this.maintc = maintc;
		this.parkf = parkf;
	}
	@Override
	public String toString() {
		return "HousePriceDTO [hcode=" + hcode + ", deposit=" + deposit + ", mrent=" + mrent + ", yrent=" + yrent
				+ ", maintc=" + maintc + ", parkf=" + parkf + "]";
	}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getMrent() {
		return mrent;
	}
	public void setMrent(int mrent) {
		this.mrent = mrent;
	}
	public int getYrent() {
		return yrent;
	}
	public void setYrent(int yrent) {
		this.yrent = yrent;
	}
	public int getMaintc() {
		return maintc;
	}
	public void setMaintc(int maintc) {
		this.maintc = maintc;
	}
	public double getParkf() {
		return parkf;
	}
	public void setParkf(double parkf) {
		this.parkf = parkf;
	}
	
}
