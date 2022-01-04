package com.edu.notice_board.domain;

import java.util.List;

import com.edu.notice_board.domain.NoticeVO;

public class NoticeVO {

	private		int				notice_bno;
	private		String			notice_title;
	private		String			notice_content;
	private		List<NoticeVO>	noticelist;
	
	public int getNotice_bno() {
		return notice_bno;
	}
	public void setNotice_bno(int notice_bno) {
		this.notice_bno = notice_bno;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public List<NoticeVO> getList() {
		return noticelist;
	}
	public void setList(List<NoticeVO> noticelist) {
		this.noticelist = noticelist;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_bno=" + notice_bno + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", list=" + noticelist + "]";
	}
	
	
}
