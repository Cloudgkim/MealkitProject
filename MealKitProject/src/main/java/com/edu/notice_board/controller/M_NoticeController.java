package com.edu.notice_board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.notice_board.domain.NoticeVO;
import com.edu.notice_board.servie.M_NoticeService;

@Controller
@RequestMapping("/manager/*")
public class M_NoticeController {
private static final Logger logger = LoggerFactory.getLogger(M_NoticeController.class);

	
	@Inject
	M_NoticeService m_noticeService;
	
	//-------------------------------------------------------------------------------------------------
	// 게시글 작성 : GET
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public void getWrite() throws Exception {
		logger.info("BoardController getWrite() GET");
	}
	
	//-------------------------------------------------------------------------------------------------
	// 게시글 작성 : POST
	// public String postWrite(BoardVO boardVO)
	// 	==>	write.jsp 페이지의 input들의 name이 BoardVO에 정의된 이름과 같으면 알아서 boardVO에 들어온다.
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_write", method=RequestMethod.POST)
	public String postWrite(NoticeVO noticeVO) throws Exception {
		
		logger.info("BoardController postWrite() => " + noticeVO);
		m_noticeService.noticewrite(noticeVO);
		
		return "redirect:/manager/notice_list";
		
	} // End - public String postWrite(BoardVO boardVO)	
	
	//-------------------------------------------------------------------------------------------------
	// 게시물 목록
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_list", method=RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		System.out.println("NoticeController getList() ");
		logger.info("NoticeController getList() ");
		
		List<NoticeVO> noticelist = null;
		noticelist = m_noticeService.m_noticelist(); // 작업할 테이블명을 매개변수로 넘겨준다.
		logger.info("NoticeController getList() return Value ==> " + noticelist);
		
		model.addAttribute("noticelist", noticelist);
	} // End - public void getList(Model model)
	
	//게시글 상세 보기
	
	@RequestMapping(value="/notice_view", method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		System.out.println("notice_view Controller getView(bno) ==> " + bno);
		logger.info("notice_view Controller getView(bno) ==> " + bno);
		
		NoticeVO noticeVO = null;
		noticeVO = m_noticeService.noticeview(bno);
		logger.info("BoardController return Value ==> " + noticeVO);
		
		model.addAttribute("noticeview", noticeVO);
		
	} // End - public void getView(@RequestParam("bno") int bno, Model model)
	
	// 게시글 수정
	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 수정한다. : GET
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_update", method=RequestMethod.GET)
 	public void getUpdate(@RequestParam("bno") int bno, Model model) throws Exception {
		
    	logger.info("BoardController getUpdate(bno) ==> " + bno);
		NoticeVO noticeVO = m_noticeService.noticeview(bno);
		logger.info("BoardController return Value ==> " + noticeVO);
		
		model.addAttribute("noticeview", noticeVO);
		
	} // End - public void getUpdate(@RequestParam("bno") int bno, Model model)
	
	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 수정한다. : POST
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_update", method=RequestMethod.POST)
	public String postUpdate(NoticeVO noticeVO) throws Exception {
		
		logger.info("BoardController postUpdate(BoardVO boardVO) ==> " + noticeVO);
		m_noticeService.noticeupdate(noticeVO);
		
		return "redirect:/manager/notice_list";
	} // End - public String postUpdate(BoardVO boardVO)
	
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : GET
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_delete", method=RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model) throws Exception {
		
		logger.info("BoardController getDelete(bno) ==> " + bno);
		NoticeVO noticeVO = null;
		noticeVO = m_noticeService.noticeview(bno);
		
		model.addAttribute("noticedelete", noticeVO);
		
	} // End - public void getDelete(@RequestParam("bno") int bno, Model model)
//
//	//-------------------------------------------------------------------------------------------------
//	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_delete", method=RequestMethod.POST)
	public String postDelete(NoticeVO noticeVO) throws Exception {
		
		logger.info("BoardController postDelete(BoardVO boardVO) ==> " + noticeVO);
		System.out.println(noticeVO.getNotice_bno());
		m_noticeService.noticedelete(noticeVO.getNotice_bno());
		
		return "redirect:/manager/notice_list";
		
	}
	
}
