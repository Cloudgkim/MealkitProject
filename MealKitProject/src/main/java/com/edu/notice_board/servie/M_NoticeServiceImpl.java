package com.edu.notice_board.servie;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.notice_board.controller.M_NoticeController;
import com.edu.notice_board.dao.M_NoticeDAO;
import com.edu.notice_board.domain.NoticeVO;

@Service
public class M_NoticeServiceImpl implements M_NoticeService {

	private static final Logger logger = LoggerFactory.getLogger(M_NoticeController.class);
	
	@Inject
	private M_NoticeDAO m_noticeDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 작성
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void noticewrite(NoticeVO noticeVO) throws Exception {

		logger.info("BoardServiceImple write() => " + noticeVO);
		m_noticeDAO.noticewrite(noticeVO);

	} // End - public void write(BoardVO boardVO)
	
	//리스트
	
	@Override
	public List<NoticeVO> m_noticelist() throws Exception {
		logger.info("noticelistServiceImple write() => ");
		return m_noticeDAO.m_noticelist();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public NoticeVO noticeview(int bno) throws Exception {

		logger.info("NoticeServiceImple view() => ");
		return m_noticeDAO.noticeview(bno);
			
	} // End - public BoardVO view(int bno)
	
	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 내용을 수정한다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public void noticeupdate(NoticeVO noticeVO) throws Exception {

		logger.info("BoardServiceImpl update(BoardVO boardVO) ==> " + noticeVO);
    	m_noticeDAO.noticeupdate(noticeVO);
		
	} // End - public void update(BoardVO boardVO)
	
	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
	//-------------------------------------------------------------------------------------------------
	@Override
	public void noticedelete(int bno) throws Exception {

		logger.info("BoardServiceImpl delete(int bno) ==> " + bno);
		m_noticeDAO.noticedelete(bno);
		
	} // End - public void delete(int bno)
	
	
}
