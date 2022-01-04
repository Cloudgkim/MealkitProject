package com.edu.mealkit.service;

import com.edu.mealkit.dto.MemberDTO;

public interface MealkitService {

	// 아이디 중복 검사
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	// 회원 가입 POST (Ajax)
	public void register(MemberDTO memberDTO) throws Exception;
	
	// 중복 회원가입 방지
	public int phoneCheck(MemberDTO memberDTO) throws Exception;
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	// 비밀번호 찾기
	public int findPass(MemberDTO memberDTO) throws Exception;
	
	// 비밀번호 새로 만들기
	public void newPass(MemberDTO memberDTO) throws Exception;
	
	// 회원 탈퇴
	public int delete(MemberDTO memberDTO) throws Exception;
		
	// 회원정보 수정
	public void updateMypage(MemberDTO memberDTO) throws Exception;
	
	// 추천인
	public MemberDTO cc_id(String id, String ccid) throws Exception;

	// 추천인 맴버 여부
	public int findccname(String id) throws Exception;

	// 추천인 여부
	public int ccTrue(String ccTure) throws Exception;

	public String findId(MemberDTO memberDTO) throws Exception;

	
} // end interface MealkitService
