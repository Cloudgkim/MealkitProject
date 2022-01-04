package com.edu.mealkit.dto;

import java.sql.Date;

//-----------------------------------------------------------------------------------------------------------
// public class MealKitDTO
//-----------------------------------------------------------------------------------------------------------
public class MemberDTO {
	
	// member
	private	String	id;			// 회원 아이디
	private	String	password;	// 회원 비민번호
	private	String	name;		// 회원 이름
	private	Date	reg_date;	// 회원 생성날짜
	private	String	tel;		// 회원 전화번호
	private	String	address;	// 회원 주소
	private	String	birth;		// 회원 생년월일
	private String   m_cc;		//추천인

	
	public String getM_cc() {
		return m_cc;
	}
	public void setM_cc(String m_cc) {
		this.m_cc = m_cc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", reg_date=" + reg_date
				+ ", tel=" + tel + ", address=" + address + ", birth=" + birth + "]";
	}
	
	
} // End - public class MealKitDTO
