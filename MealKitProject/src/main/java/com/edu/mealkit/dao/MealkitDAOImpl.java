package com.edu.mealkit.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.mealkit.dto.MemberDTO;

@Repository
public class MealkitDAOImpl implements MealkitDAO {

private static final Logger logger = LoggerFactory.getLogger(MealkitDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String nameSpace = "com.edu.mealkit.mapper.mealkitMapper";
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		
		logger.info("MealkitDAOImpl 아이디 중복 검사()");
		return sqlSession.selectOne(nameSpace + ".idCheck", memberDTO);
		
	} // End - public int idCheck(MealkitDTO mealkitDTO)
	
	
	//-------------------------------------------------------------------------------------------------
	// 회원가입 POST (Ajax)
	//-------------------------------------------------------------------------------------------------
	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		logger.info("회원가입(Ajax) : " + memberDTO);
		sqlSession.insert(nameSpace + ".register", memberDTO);
		
	} // end void register(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 중복 회원가입 방지
	//-------------------------------------------------------------------------------------------------
	@Override
	public int phoneCheck(MemberDTO memberDTO) throws Exception {
		logger.info("중복 회원가입 방지 : " + memberDTO.getTel());
		return sqlSession.selectOne(nameSpace + ".phoneCheck", memberDTO);
		
	} // end int phoneCheck(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 로그인
	//-------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		logger.info("로그인 : " + memberDTO);
		return sqlSession.selectOne(nameSpace + ".login", memberDTO);
	}
	
	//-------------------------------------------------------------------------------------------------
		// 회원 탈퇴
		//-------------------------------------------------------------------------------------------------
		@Override
		public int delete(MemberDTO memberDTO) throws Exception {
			
			logger.info("DAOImpl 회원탈퇴하자~~~~~~~~~~~~~~~~~" + memberDTO);
			return sqlSession.delete(nameSpace + ".delete", memberDTO);
			
		} // end void delete(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 비밀번호 찾기
	//-------------------------------------------------------------------------------------------------
	@Override
	public int findPass(MemberDTO memberDTO) throws Exception {

		logger.info("DAOImpl 비밀버노 찾아라~~~~~~~~~~~~~~~~~~"+memberDTO);
		return sqlSession.selectOne(nameSpace + ".findPass", memberDTO);
			
	} // end int findPass(String id, String phone)

	//-------------------------------------------------------------------------------------------------
	// 비밀번호 새로 저장하기
	//-------------------------------------------------------------------------------------------------
	@Override
	public void newPass(MemberDTO memberDTO) throws Exception {
			
		logger.info("DAOImpl 비밀버노 저장해라~~~~~~~~~~~~~~~~~"+memberDTO);
		sqlSession.update(nameSpace + ".newPass", memberDTO);
			
	} // end void newPass(MemberDTO memberDTO)

	//-------------------------------------------------------------------------------------------------
	// 회원정보 수정
	//-------------------------------------------------------------------------------------------------
	@Override
	public void updateMypage(MemberDTO memberDTO) throws Exception {
		sqlSession.update(nameSpace + ".updateMypage", memberDTO);
	
	} // end void updateMypage(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 추천인 넣기
	//-------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO cc_id(@Param("id") String id, @Param("ccid") String ccid) throws Exception {
		logger.info("id : " + id + ", ccid : " + ccid);
		// return sqlSession.selectOne(nameSpace + ".loginMultiParam");
		
		HashMap<String, String> inputValues = new HashMap<String, String>();
		inputValues.put("id", 		ccid);
		inputValues.put("ccid", 	id);
		return sqlSession.selectOne(nameSpace + ".cc_id", inputValues);
	}

	//-------------------------------------------------------------------------------------------------
	// 추천인 맴버 여부
	//-------------------------------------------------------------------------------------------------
	@Override
	public int findccname(String id) throws Exception {

		logger.info("DAOImpl 추천인 찾아라~~~~~~~~~~~~~~~~~~"+id);
		return sqlSession.selectOne(nameSpace + ".findccname", id);
			
	}
	
	//-------------------------------------------------------------------------------------------------
	// 추천인 여부
	//-------------------------------------------------------------------------------------------------
	@Override
	public int ccTrue(String ccTure) throws Exception{
		return sqlSession.selectOne(nameSpace + ".ccTrue", ccTure);
	}
	
	@Override
	public String findId(MemberDTO memberDTO) throws Exception {

		logger.info("DAOImpl 아이디 찾아라~~~~~~~~~~~~~~~~~~"+memberDTO);
		return sqlSession.selectOne(nameSpace + ".findId", memberDTO);
			
	}
	
} // end class MealkitDAOImpl implements MealkitDAO
