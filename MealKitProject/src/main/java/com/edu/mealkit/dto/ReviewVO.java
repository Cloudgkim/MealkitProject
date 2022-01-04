package com.edu.mealkit.dto;

import java.sql.Timestamp;

public class ReviewVO {

	private		int				r_no;
	private		int				r_mkno;
	private		String 			mk_name;
	private		String			r_detail;
	private		String			r_writer;
	private		Timestamp		r_date;
	private     int 			star;
	private 	String 			mk_img;
	
	
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_mkno() {
		return r_mkno;
	}
	public void setR_mkno(int r_mkno) {
		this.r_mkno = r_mkno;
	}
	
	public String getMk_name() {
		return mk_name;
	}
	public void setMk_name(String mk_name) {
		this.mk_name = mk_name;
	}
	public String getMk_img() {
		return mk_img;
	}
	public void setMk_img(String mk_img) {
		this.mk_img = mk_img;
	}
	public String getR_detail() {
		return r_detail;
	}
	public void setR_detail(String r_detail) {
		this.r_detail = r_detail;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [r_no=" + r_no + ", r_mkno=" + r_mkno + ", mk_name=" + mk_name + ", r_detail=" + r_detail
				+ ", r_writer=" + r_writer + ", r_date=" + r_date + ", star=" + star + ", mk_img=" + mk_img + "]";
	}

	
}
