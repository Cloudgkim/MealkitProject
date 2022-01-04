package com.edu.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.board.domain.BoardVO;
import com.edu.board.domain.CommentDTO;
import com.edu.board.service.CommentService;
import com.edu.board.service.M_BoardService;
import com.edu.mealkit.dto.ManagerDTO;

//-------------------------------------------------------------------------------------------------
// 게시글 관련 컨트롤러
// @RequestMapping("/board") => url의 시작이 /board로 시작하는 것을 담당하는 컨트롤러
 //-------------------------------------------------------------------------------------------------
@Controller
@RequestMapping("/manager/*")
public class M_BoardController {

	private static final Logger logger = LoggerFactory.getLogger(M_BoardController.class);
	
	@Inject
	M_BoardService m_boardService;
	
	//-------------------------------------------------------------------------------------------------
	   // 게시물 목록
	   //-------------------------------------------------------------------------------------------------
	   @RequestMapping(value="/m_boardList", method=RequestMethod.GET)
	   public void getList(Model model, HttpSession session) throws Exception {
	      
	      ManagerDTO managerDTO = (ManagerDTO)session.getAttribute("manager");
	      List<BoardVO> Boardlist = m_boardService.boardlist();
	      
	      model.addAttribute("boardlist", Boardlist);
	      model.addAttribute("manager", managerDTO);
	      
	   } // End - public void getList(Model model)
	   
//	//-------------------------------------------------------------------------------------------------
//	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/m_boardView", method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception {
		
		System.out.println("BoardController getView(bno) ==> " + bno);
		logger.info("BoardController getView(bno) ==> " + bno);
		ManagerDTO managerDTO = (ManagerDTO)session.getAttribute("manager");
		 model.addAttribute("manager", managerDTO);
	      
		BoardVO boardVO = null;
		boardVO = m_boardService.boardview(bno);
		logger.info("BoardController return Value ==> " + boardVO);
		
		model.addAttribute("boardview", boardVO);
		
	} // End - public void getView(@RequestParam("bno") int bno, Model model)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 수정한다. : GET
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/m_boardUpdate", method=RequestMethod.GET)
 	public void getUpdate(@RequestParam("bno") int bno, Model model) throws Exception {
		
    	logger.info("BoardController getUpdate(bno) ==> " + bno);
		BoardVO boardVO = m_boardService.boardview(bno);
		logger.info("BoardController return Value ==> " + boardVO);
		
		model.addAttribute("boardview", boardVO);
		
	} // End - public void getUpdate(@RequestParam("bno") int bno, Model model)
//	
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 수정한다. : POST
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/m_boardUpdate", method=RequestMethod.POST)
	public String postUpdate(BoardVO boardVO) throws Exception {
		
		logger.info("BoardController postUpdate(BoardVO boardVO) ==> " + boardVO);
		m_boardService.boardupdate(boardVO);
		
		return "redirect:/manager/m_boardList";
	} // End - public String postUpdate(BoardVO boardVO)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : GET
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/m_boardDelete", method=RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model) throws Exception {
		
		logger.info("BoardController getDelete(bno) ==> " + bno);
		BoardVO boardVO = null;
		boardVO = m_boardService.boardview(bno);
		
		model.addAttribute("boardview", boardVO);
		
	} // End - public void getDelete(@RequestParam("bno") int bno, Model model)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/m_boardDelete", method=RequestMethod.POST)
	public String postDelete(BoardVO boardVO) throws Exception {
		
		logger.info("BoardController postDelete(BoardVO boardVO) ==> " + boardVO);
		m_boardService.boarddelete(boardVO.getBno());
		
		// /WEB-INF/views + /board/list + .jsp
		return "redirect:/manager/m_boardList";
		
	}
	
} // End - public class BoardController
