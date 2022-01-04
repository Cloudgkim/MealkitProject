package com.edu.board.dao;

import java.util.List;

import com.edu.board.domain.CommentDTO;

public interface CommentDAO {
    
	//----------------------------------------------
	//댓글목록
	//----------------------------------------------
	public List<CommentDTO> list(Integer bno);
	
	//----------------------------------------------
	//댓글입력
	//----------------------------------------------
	public void insert(CommentDTO dto);

	//-----------------------------------
	//댓글삭제
	//-----------------------------------

	public int delete(Integer idx) throws Exception ;

	public String findResult(int idx);
}
