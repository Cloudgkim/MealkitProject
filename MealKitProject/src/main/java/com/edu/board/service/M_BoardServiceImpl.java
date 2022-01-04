package com.edu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.board.controller.M_BoardController;
import com.edu.board.dao.M_BoardDAO;
import com.edu.board.domain.BoardVO;

@Service
public class M_BoardServiceImpl implements M_BoardService {

private static final Logger logger = LoggerFactory.getLogger(M_BoardController.class);
	
	@Inject
	private M_BoardDAO m_boardDAO;

	//-----------------------------------------------------------------------------------------------------------
	// 게시물 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BoardVO> boardlist() throws Exception {

		logger.info("BoardServiceImple list() => ");
		return m_boardDAO.boardlist();
		
	} // End - public List<BoardVO> list(String tbl)
 
	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public BoardVO boardview(int bno) throws Exception {

		logger.info("BoardServiceImple view() => ");
		return m_boardDAO.boardview(bno);
		
	} // End - public BoardVO view(int bno)

	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 내용을 수정한다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public void boardupdate(BoardVO boardVO) throws Exception {

		logger.info("BoardServiceImpl update(BoardVO boardVO) ==> " + boardVO);
		m_boardDAO.boardupdate(boardVO);
		
	} // End - public void update(BoardVO boardVO)

	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
	//-------------------------------------------------------------------------------------------------
	@Override
	public void boarddelete(int bno) throws Exception {

		logger.info("BoardServiceImpl delete(int bno) ==> " + bno);
		m_boardDAO.boarddelete(bno);
		
	} // End - public void delete(int bno)
	
	
}
