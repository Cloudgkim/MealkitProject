package com.edu.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.domain.CommentDTO;
import com.edu.board.service.CommentService;
import com.edu.mealkit.dto.ManagerDTO;
import com.edu.mealkit.dto.MemberDTO;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
   @Inject
   CommentService commentService;
   
   Logger logger = LoggerFactory.getLogger(CommentController.class);
   
   //---------------------------------------------------------
   //댓글목록 보여주기(데이터를 리턴해준다)
   //---------------------------------------------------------
   @ResponseBody
   @RequestMapping("listJson")
   //@RequestBody //리턴데이터를 json으로 변환
   public List<CommentDTO> listJson(@RequestParam int bno){
	   List<CommentDTO> list = commentService.list(bno);
	   return list;
   }
   //---------------------------------------------------------
   //댓글 입력
   //---------------------------------------------------------
   @ResponseBody
   @RequestMapping("insert")
   public void insert(CommentDTO dto){
      logger.info("CommentController insert() =>" + dto); //dto에 뭐가담겨있나 보는거지
      commentService.insert(dto);
    }
   //------------------------------------------------------
   //댓글 삭제처리
   //------------------------------------------------------
   @ResponseBody
   @RequestMapping(value="/delete/{idx}")
   public int delete(@PathVariable int idx,HttpSession session) throws Exception {
	   
	   int result = 0;
	   MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	   String memberId = commentService.findResult(idx);
	   System.out.println(idx);
	   if(memberDTO.getId().equals(memberId)) {
		   commentService.delete(idx);
		   
		   result =1;
	   } 
	   return result;
    }
   
   //------------------------------------------------------
   //댓글 삭제처리
   //------------------------------------------------------
   @ResponseBody
   @RequestMapping(value="/m_delete/{idx}")
   public int delete(@PathVariable int idx) throws Exception {
	   System.out.println("CommentController delete()=>"+ idx);
	   return commentService.delete(idx);
    }

}
