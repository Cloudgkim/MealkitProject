package com.edu.notice_board.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.notice_board.domain.NoticeVO;
import com.edu.notice_board.domain.nb_Criteria;
import com.edu.notice_board.domain.nb_PageMaker;
import com.edu.notice_board.servie.NoticeService;

@Controller
@RequestMapping("/notice_board/*")
public class NoticeController {

private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService noticeService;
	
	//-------------------------------------------------------------------------------------------------
	// 게시물 목록
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_list", method=RequestMethod.GET)
	public String getList(Model model, nb_Criteria cri) throws Exception {
		
		System.out.println("NoticeController getList() ");
		logger.info("NoticeController getList() ");
		
		model.addAttribute("noticelist", noticeService.noticelist(cri));
		
		nb_PageMaker nb_pageMaker = new nb_PageMaker();
		nb_pageMaker.setCri(cri);
		nb_pageMaker.setTotalCount(noticeService.listCount());
		
		model.addAttribute("pageMaker", nb_pageMaker);
		
		return "notice_board/notice_list";
		
	} // End - public void getList(Model model)

//	//-------------------------------------------------------------------------------------------------
//	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
//	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/notice_view", method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		System.out.println("NoticeController getView(bno) ==> " + bno);
		logger.info("NoticeController getView(bno) ==> " + bno);
		
		NoticeVO NoticeVO = null;
		NoticeVO = noticeService.noticeview(bno);
		logger.info("BoardController return Value ==> " + NoticeVO);
		
		model.addAttribute("Noticeview", NoticeVO);
		
	} // End - public void getView(@RequestParam("bno") int bno, Model model)
	
}
