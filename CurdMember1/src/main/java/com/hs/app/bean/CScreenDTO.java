package com.hs.app.bean;

public class CScreenDTO {
	private int idx;
	private int cinema;
	private int movie;
	private String sdate;
	private String stime;
	
	public CScreenDTO() {}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCinema() {
		return cinema;
	}
	public void setCinema(int cinema) {
		this.cinema = cinema;
	}
	public int getMovie() {
		return movie;
	}
	public void setMovie(int movie) {
		this.movie = movie;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public int getRemain_seat() {
		return remain_seat;
	}
	public void setRemain_seat(int remain_seat) {
		this.remain_seat = remain_seat;
	}
	private int remain_seat;
}
