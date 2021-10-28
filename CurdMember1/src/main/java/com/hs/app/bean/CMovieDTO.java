package com.hs.app.bean;

public class CMovieDTO {
	private int idx;
	private String name;
	private String running_time;
	private String release_date;
	private String plot;
	private String image;
	
	public CMovieDTO() {}
	
	public CMovieDTO(String name, String running_time, String release_date, String plot, String image) {
		super();
		this.name = name;
		this.running_time = running_time;
		this.release_date = release_date;
		this.plot = plot;
		this.image = image;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRunning_time() {
		return running_time;
	}
	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
