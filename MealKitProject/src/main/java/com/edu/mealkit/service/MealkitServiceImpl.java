package com.edu.mealkit.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.mealkit.dao.MealkitDAO;
import com.edu.mealkit.dto.MemberDTO;

@Service
public class MealkitServiceImpl implements MealkitService {

private static final Logger logger = LoggerFactory.getLogger(MealkitServiceImpl.class);
	
	@Inject
	private MealkitDAO mealkitDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 회원 아이디 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		
		logger.info("MealkitServieImpl 아이디 중복 검사()");
		int result = mealkitDAO.idCheck(memberDTO);
		return result;
		
	} // End - public int idCheck(MealkitDTO mealkitDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 회원가입 POST (Ajax)
	//-------------------------------------------------------------------------------------------------
	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		mealkitDAO.register(memberDTO);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 중복 회원가입 방지
	//-------------------------------------------------------------------------------------------------
	@Override
	public int phoneCheck(MemberDTO memberDTO) throws Exception {
		
		logger.info("MealkitServieImpl 중복 회원가입 방지");
		int result = mealkitDAO.phoneCheck(memberDTO);
		return result;
		
	} // end int phoneCheck(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 로그인
	//-------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		logger.info("Member login~~~~~~~~~~"+memberDTO);
		return mealkitDAO.login(memberDTO);
	}
	//-------------------------------------------------------------------------------------------------
	// 회원 탈퇴
	//-------------------------------------------------------------------------------------------------
	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		
		logger.info("ServiceImpl 회원탈퇴~~~~~~~~~~~~~~~");
		return mealkitDAO.delete(memberDTO);
		
	} // end void delete(MemberDTO memberDTO)


	//-------------------------------------------------------------------------------------------------
	// 비밀번호 찾기
	//-------------------------------------------------------------------------------------------------
	@Override
	public int findPass(MemberDTO memberDTO) throws Exception {
			
		logger.info("ServiceImpl 비밀번호 찾아라~~~~~~~~~~~~~~~~~");
		return mealkitDAO.findPass(memberDTO);
			
	} // end int findPass(String id, String phone)

	//-------------------------------------------------------------------------------------------------
	// 비밀번호 새로 만들기
	//-------------------------------------------------------------------------------------------------
	@Override
	public void newPass(MemberDTO memberDTO) throws Exception {
			
		logger.info("ServiceImpl 비밀번호 새로 저장~~~~~~~~~~~~~~~~");
		mealkitDAO.newPass(memberDTO);
			
	} // end void newPass(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	//-------------------------------------------------------------------------------------------------
	@Override
	public void updateMypage(MemberDTO memberDTO) throws Exception {
		mealkitDAO.updateMypage(memberDTO);
		
	} // end void updateMypage(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 추천인 넣기
	//-------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO cc_id(String id, String ccid) throws Exception {
		return mealkitDAO.cc_id(id, ccid);
	}

	//-------------------------------------------------------------------------------------------------
	// 추천인 맴버 여부
	//-------------------------------------------------------------------------------------------------
	@Override
	public int findccname(String id) throws Exception {
			
		logger.info("ServiceImpl 추천인 찾아라~~~~~~~~~~~~~~~~~");
		return mealkitDAO.findccname(id);
			
	}
	
	//-------------------------------------------------------------------------------------------------
	// 추천인 여부
	//-------------------------------------------------------------------------------------------------
	public int ccTrue(String ccTure) throws Exception{
		logger.info("ServiceImpl 추천인 있냐~~~~~~~~~~~~~~~~~");
		return mealkitDAO.ccTrue(ccTure);
	}
	
	@Override
	public String findId(MemberDTO memberDTO) throws Exception {
			
		logger.info("ServiceImpl 아이디 찾아라~~~~~~~~~~~~~~~~~");
		return mealkitDAO.findId(memberDTO);
			
	}
	
	
} // End - public class MealKitServiceImpl implements MealKitService
