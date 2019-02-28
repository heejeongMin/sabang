package com.localWeather;

import java.util.Calendar;

public class TimeFetcher {
	
	public Calendar getBaseTime() {
		Calendar c = Calendar.getInstance();
//		System.out.println(getLastBaseTime(c));
//		int t = c.HOUR_OF_DAY;
//		if (t < 2) {
//			t = 23;
//		} else {
//			if (t<5) {
//				t = 2;
//			}else if (t<8) {
//				t = 5;
//			}else if (t<11) {
//				t = 8;
//			}else if (t<14) {
//				t = 11;
//			} else if (t<17) {
//				t = 14;
//			} else if (t<20) {
//				t = 17;
//			} else if (t < 23) {
//				t = 20;
//			} else {
//				t= 23;
//			}
//		}
		return getLastBaseTime(c);
	}
	
	private Calendar getLastBaseTime(Calendar calBase) {
		int t = calBase.get(Calendar.HOUR_OF_DAY);
		if (t < 2) {

		calBase.add(Calendar.DATE, -1);
		calBase.set(Calendar.HOUR_OF_DAY, 23);

		} else {

		calBase.set(Calendar.HOUR_OF_DAY, t - (t + 1) % 3);

		}
		return calBase;

		}
	
	
}
