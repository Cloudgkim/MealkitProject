package com.edu.notice_board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.notice_board.domain.NoticeVO;

@Repository
public class M_NoticeDAOImpl implements M_NoticeDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAOImpl.class);
	
	// 의존관계 주입(DI : Defendency Injection)
	@Inject
	SqlSession sqlSession;
			
	// namespace 이름 정확하게 작성할 것 : 조심하자!
	private static String namespace = "com.edu.mealkit.mapper.m_noticeMapper";
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 작성
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void noticewrite(NoticeVO noticeVO) throws Exception {

		logger.info("BoardDAOImpl write() => " + noticeVO);
		sqlSession.insert(namespace + ".insert", noticeVO);

	} // End - public void write(BoardVO boardVO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<NoticeVO> m_noticelist() throws Exception {
	
		logger.info("noticelistDAOImpl list() => ");
		return sqlSession.selectList(namespace + ".m_noticelist");
			
	} // ENd - public List<BoardVO> list(String tbl)
	
	//-----------------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 상세정보를 가져온다.
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public NoticeVO noticeview(int bno) throws Exception {

		logger.info("M_NoticeDAOImpl view(bno) => " + bno);
		return sqlSession.selectOne(namespace + ".view", bno);
		
	} // End - public BoardVO view(int bno)

	//-------------------------------------------------------------------------------------------------
	// 글번호에 해당하는 게시글의 내용을 수정한다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public void noticeupdate(NoticeVO noticeVO) throws Exception {

		logger.info("BoardDAOImpl update(BoardVO boardVO) => " + noticeVO);
		sqlSession.update(namespace + ".update", noticeVO);
			
	}
	
	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
	//-------------------------------------------------------------------------------------------------
	@Override
	public void noticedelete(int bno) throws Exception {

		logger.info("BoardDAOImpl delete(int bno) => " + bno);
		sqlSession.delete(namespace + ".delete", bno);
		
	}
	
}


