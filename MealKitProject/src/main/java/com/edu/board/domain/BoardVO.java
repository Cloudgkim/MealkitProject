package com.edu.board.domain;

import java.sql.Timestamp;
import java.util.List;

//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;

//-------------------------------------------------------------------------------------------------
// public class BoardVO
//-------------------------------------------------------------------------------------------------
//@Getter
//@Setter
//@ToString
// @Data
public class BoardVO {

	private		int				bno;
	private		String			title;
	private		String			b_content;
	private		String			writer;
	private		String 			b_kind;
	private		Timestamp		b_reg_Date;
	private		List<BoardVO>	list;
	
	public String getB_kind() {
		return b_kind;
	}
	public void setB_kind(String b_kind) {
		this.b_kind = b_kind;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getB_reg_Date() {
		return b_reg_Date;
	}
	public void setB_reg_Date(Timestamp b_reg_Date) {
		this.b_reg_Date = b_reg_Date;
	}
	public List<BoardVO> getList() {
		return list;
	}
	public void setList(List<BoardVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", b_content=" + b_content + ", writer=" + writer
				+ ", b_kind=" + b_kind + ", b_reg_Date=" + b_reg_Date + ", list=" + list + "]";
	}

	
} // End - public class BoardVO



