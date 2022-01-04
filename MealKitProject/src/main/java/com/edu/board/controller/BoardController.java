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

import com.edu.board.domain.BoardKindDTO;
import com.edu.board.domain.BoardVO;
import com.edu.board.service.BoardService;
import com.edu.mealkit.dto.MemberDTO;

//-------------------------------------------------------------------------------------------------
// 게시글 관련 컨트롤러
// @RequestMapping("/board") => url의 시작이 /board로 시작하는 것을 담당하는 컨트롤러
//-------------------------------------------------------------------------------------------------
@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;

//	//-------------------------------------------------------------------------------------------------
//	// 게시글 작성 : GET
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/boardWrite", method=RequestMethod.GET)
	   public void getWrite(Model model) throws Exception {
	      
	      List<BoardKindDTO> boardKindDTO = boardService.getKind();
	      model.addAttribute("kind", boardKindDTO);
	      
	   } // end void getWrite(Model model)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 작성 : POST
//	// public String postWrite(BoardVO boardVO)
//	// 	==>	write.jsp 페이지의 input들의 name이 BoardVO에 정의된 이름과 같으면 알아서 boardVO에 들어온다.
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public String postWrite(BoardVO boardVO) throws Exception {
		
		logger.info("BoardController postWrite() => " + boardVO);
		boardService.boardwrite(boardVO);
		
		return "redirect:/board/boardList";
		
	} // End - public String postWrite(BoardVO boardVO)
	
	//-------------------------------------------------------------------------------------------------
	   // 1:1 문의 내꺼 목록()
	   //-------------------------------------------------------------------------------------------------
	   @RequestMapping(value="/boardList", method=RequestMethod.GET)
	   public void getList(Model model, HttpSession session) throws Exception {
	      
	      MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	      List<BoardVO> Boardlist = boardService.boardlist(memberDTO.getId());
	      
	      System.out.println(Boardlist);
	      
	      model.addAttribute("boardlist", Boardlist);
	      model.addAttribute("member", memberDTO); 
	      
	   } // End - public void getList(Model model)
//	//-------------------------------------------------------------------------------------------------
//	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/boardView", method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		System.out.println("BoardController getView(bno) ==> " + bno);
		logger.info("BoardController getView(bno) ==> " + bno);
		
		BoardVO boardVO = null;
		boardVO = boardService.boardview(bno);
		logger.info("BoardController return Value ==> " + boardVO);
		
		model.addAttribute("boardview", boardVO);
		
	} // End - public void getView(@RequestParam("bno") int bno, Model model)
	
	//-------------------------------------------------------------------------------------------------
	   // 게시글 번호에 해당하는 게시글의 정보를 수정한다. : GET
	   //-------------------------------------------------------------------------------------------------
	   @RequestMapping(value="/boardUpdate", method=RequestMethod.GET)
	    public void getUpdate(@RequestParam("bno") int bno, Model model) throws Exception {
	      
	      BoardVO boardVO = boardService.boardview(bno);
	      List<BoardKindDTO> boardKindDTO = boardService.getKind();
	      
	      model.addAttribute("boardview", boardVO);
	      model.addAttribute("kind", boardKindDTO);
	      
	   } // End - public void getUpdate(@RequestParam("bno") int bno, Model model)
//	
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 수정한다. : POST
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String postUpdate(BoardVO boardVO) throws Exception {
		
		logger.info("BoardController postUpdate(BoardVO boardVO) ==> " + boardVO);
		boardService.boardupdate(boardVO);
		
		return "redirect:/board/boardList";
	} // End - public String postUpdate(BoardVO boardVO)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : GET
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model) throws Exception {
		
		logger.info("BoardController getDelete(bno) ==> " + bno);
		BoardVO boardVO = null;
		boardVO = boardService.boardview(bno);
		
		model.addAttribute("boardview", boardVO);
		
	} // End - public void getDelete(@RequestParam("bno") int bno, Model model)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/boardDelete", method=RequestMethod.POST)
	public String postDelete(BoardVO boardVO) throws Exception {
		
		logger.info("BoardController postDelete(BoardVO boardVO) ==> " + boardVO);
		boardService.boarddelete(boardVO.getBno());
		
		// /WEB-INF/views + /board/list + .jsp
		return "redirect:/board/boardList";
		
	}
	
	
} // End - public class BoardController
