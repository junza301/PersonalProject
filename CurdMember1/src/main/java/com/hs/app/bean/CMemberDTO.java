package com.hs.app.bean;

public class CMemberDTO {
	private int idx;
	private String id;
	private String pw;
	private String name;
	
	public CMemberDTO() {}
	
	public CMemberDTO(String id, String pw, String name, String email) {		
		this.id = id;
		this.pw = pw;
		this.name = name;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	
	
	
}
