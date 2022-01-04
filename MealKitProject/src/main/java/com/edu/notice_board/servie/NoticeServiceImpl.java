package com.edu.notice_board.servie;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.notice_board.controller.NoticeController;
import com.edu.notice_board.dao.NoticeDAO;
import com.edu.notice_board.domain.NoticeVO;
import com.edu.notice_board.domain.nb_Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> noticelist(nb_Criteria cri) throws Exception {
		logger.info("noticelistServiceImple write() => ");
		return noticeDAO.noticelist(cri);
	}
	
	@Override
	public int listCount() throws Exception{
		return noticeDAO.listCount();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public NoticeVO noticeview(int bno) throws Exception {

		logger.info("BoardServiceImple view() => ");
		return noticeDAO.noticeview(bno);
		
	} // End - public BoardVO view(int bno)

}
