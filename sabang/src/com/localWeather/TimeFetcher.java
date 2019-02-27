package com.localWeather;

import java.util.Calendar;

public class TimeFetcher {
	
	public Calendar getBaseTime() {
		Calendar c = Calendar.getInstance();
//		System.out.println(getLastBaseTime(c));
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
