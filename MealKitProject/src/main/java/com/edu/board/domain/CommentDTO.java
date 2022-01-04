package com.edu.board.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentDTO {

	
	private int idx;           //댓글일련번호
	private String comment;    //댓글내용
	private int bno;           //게시글번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	   private      Date      reg_date; 
	private Date update_date;  //작성자가 댓글수정한 날짜
	private String writer;  //작성자
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "CommentDTO [idx=" + idx + ", comment=" + comment + ", bno=" + bno + ", reg_date=" + reg_date
				+ ", update_date=" + update_date + ", writer=" + writer + "]";
	}
	
	

  
}
