package com.edu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.board.dao.CommentDAO;
import com.edu.board.domain.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
  @Inject
  CommentDAO commentDAO;
    //-----------------------------------
	//댓글목록
	//-----------------------------------
	@Override
	public List<CommentDTO> list(Integer bno) {
		return commentDAO.list(bno);
	}
   //-----------------------------------
   //댓글입력
   //-----------------------------------
	@Override
	public void insert(CommentDTO dto) {
		commentDAO.insert(dto);
	}
	
	//-----------------------------------
	//댓글삭제
    //-----------------------------------
	@Override
	public int delete(Integer idx) throws Exception {
		 return commentDAO.delete(idx); 
		
	}
		
	@Override
	public String findResult(int idx) {
		return commentDAO.findResult(idx);
	}
}
