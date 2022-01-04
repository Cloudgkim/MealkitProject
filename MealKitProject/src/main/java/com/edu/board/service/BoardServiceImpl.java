package com.edu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.board.controller.BoardController;
import com.edu.board.dao.BoardDAO;
import com.edu.board.domain.BoardKindDTO;
import com.edu.board.domain.BoardVO;

//-----------------------------------------------------------------------------------------------------------
// public class BoardServiceImpl implements BoardService
//-----------------------------------------------------------------------------------------------------------
@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardDAO boardDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 작성
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void boardwrite(BoardVO boardVO) throws Exception {

		logger.info("BoardServiceImple write() => " + boardVO);
		boardDAO.boardwrite(boardVO);

	} // End - public void write(BoardVO boardVO)

	//-----------------------------------------------------------------------------------------------------------
	// 게시물 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BoardVO> boardlist(String id) throws Exception {

		logger.info("BoardServiceImple list() => " + id);
		return boardDAO.boardlist(id);
		
	} 

	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public BoardVO boardview(int bno) throws Exception {

		logger.info("BoardServiceImple view() => ");
		return boardDAO.boardview(bno);
		
	} // End - public BoardVO view(int bno)

	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 내용을 수정한다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public void boardupdate(BoardVO boardVO) throws Exception {

		logger.info("BoardServiceImpl update(BoardVO boardVO) ==> " + boardVO);
    	boardDAO.boardupdate(boardVO);
		
	} // End - public void update(BoardVO boardVO)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
//	//-------------------------------------------------------------------------------------------------
	@Override
	public void boarddelete(int bno) throws Exception {

		logger.info("BoardServiceImpl delete(int bno) ==> " + bno);
		boardDAO.boarddelete(bno);
//		
	} // End - public void delete(int bno)
//	
	//-------------------------------------------------------------------------------------------------
	// 문의 종류 갖고 오기
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<BoardKindDTO> getKind() throws Exception {
		return boardDAO.getKind();
		} // end List<BoardKindDTO> getKind()
		
	@Override
	public int boardcount(String id) throws Exception {
		logger.info("BoardServiceImpl count(MemberDTO memberDTO) ==> " +id);
		return boardDAO.boardcount(id);
	}
	
	

} // End - public class BoardServiceImpl implements BoardService







