package com.edu.notice_board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.notice_board.domain.NoticeVO;
import com.edu.notice_board.domain.nb_Criteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
private static final Logger logger = LoggerFactory.getLogger(NoticeDAOImpl.class);
	
	// 의존관계 주입(DI : Defendency Injection)
	@Inject
	SqlSession sqlSession;
	
	// namespace 이름 정확하게 작성할 것 : 조심하자!
	private static String namespace = "com.edu.mealkit.mapper.noticeMapper";

	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<NoticeVO> noticelist(nb_Criteria cri) throws Exception {

		logger.info("noticelistDAOImpl list() => ");
		return sqlSession.selectList(namespace + ".noticelist", cri);
		
	} // ENd - public List<BoardVO> list(String tbl)
	
	@Override
	public int listCount() throws Exception{
		return sqlSession.selectOne(namespace + ".listCount" );
	}
	
	@Override
	public NoticeVO noticeview(int bno) throws Exception {

		logger.info("BoardDAOImpl view(bno) => " + bno);
		return sqlSession.selectOne(namespace + ".view", bno);
		
	} // End - public BoardVO view(int bno)

}
