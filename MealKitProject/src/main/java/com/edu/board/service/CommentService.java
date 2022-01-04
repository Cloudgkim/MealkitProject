package com.edu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.board.dao.CommentDAO;
import com.edu.board.domain.CommentDTO;

public interface CommentService {
	
	//-----------------------------------
	//댓글목록
	//-----------------------------------
	public List<CommentDTO> list(Integer bno);
	
	//-----------------------------------
	//댓글입력
	//-----------------------------------
	public void insert(CommentDTO dto) ;
	
	//-----------------------------------
	//댓글삭제
    //-----------------------------------
	public int delete(Integer idx) throws Exception ;

	public String findResult(int idx);
	
}
