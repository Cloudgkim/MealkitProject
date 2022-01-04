package com.edu.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.board.domain.CommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {
     @Inject
     SqlSession sqlSession;
     
  // namespace 이름 정확하게 작성할 것 : 조심하자!
 	private static String namespace = "com.edu.mealkit.mapper.commentMapper";
   
 	//------------------------------------
    //댓글목록
 	//------------------------------------
 	@Override
 	 public List<CommentDTO> list(Integer bno) {
 	  return sqlSession.selectList(namespace+".listComment",bno);
 	 }
 		
 	//------------------------------------
 	//댓글입력
 	//------------------------------------
 	@Override
	public void insert(CommentDTO dto) {
		 sqlSession.insert(namespace + ".insertComment",dto);
	}

	//-----------------------------------
	//댓글삭제
	//-----------------------------------
	@Override
	public int delete(Integer idx) throws Exception {
		return sqlSession.delete(namespace+".deleteComment",idx);	
	}
	
	@Override
	public String findResult(int idx) {
		return sqlSession.selectOne(namespace+".findResult",idx);
	}
	

}
