package com.edu.notice_board.dao;

import java.util.List;

import com.edu.notice_board.domain.NoticeVO;
import com.edu.notice_board.domain.nb_Criteria;

public interface NoticeDAO {
	
	public List<NoticeVO> noticelist(nb_Criteria cri) throws  Exception;
	
	public int listCount() throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
	//-----------------------------------------------------------------------------------------------------------
	public NoticeVO noticeview(int bno) throws Exception;

}
