package com.edu.mealkit.dto;

//-----------------------------------------------------------------------------------------------------------
// public class MealKitDTO
//-----------------------------------------------------------------------------------------------------------
// @Getter
// @Setter
// @ToString
public class MealkitDTO {
	
	private	int		mk_id;				// 밀키트 등록번호
	private	String	mk_name;			// 밀키트 이름
	private	int		mk_price;			// 밀키트 가격
	private	String	mk_kind;			// 밀키트 종류
	private	int		mk_count;			// 밀키트 재고량
	private	String	mk_img;				// 밀키트 이미지
	private	String	mk_content;			// 밀키트 내용
	private	String	mk_discount_rate;	// 밀키트 할인율
	
	private String	mk_thumbImg;		// 썸네일

	
	public int getMk_id() {
		return mk_id;
	}

	public void setMk_id(int mk_id) {
		this.mk_id = mk_id;
	}

	public String getMk_name() {
		return mk_name;
	}

	public void setMk_name(String mk_name) {
		this.mk_name = mk_name;
	}

	public int getMk_price() {
		return mk_price;
	}

	public void setMk_price(int mk_price) {
		this.mk_price = mk_price;
	}

	public String getMk_kind() {
		return mk_kind;
	}

	public void setMk_kind(String mk_kind) {
		this.mk_kind = mk_kind;
	}

	public int getMk_count() {
		return mk_count;
	}

	public void setMk_count(int mk_count) {
		this.mk_count = mk_count;
	}

	public String getMk_img() {
		return mk_img;
	}

	public void setMk_img(String mk_img) {
		this.mk_img = mk_img;
	}

	public String getMk_content() {
		return mk_content;
	}

	public void setMk_content(String mk_content) {
		this.mk_content = mk_content;
	}

	public String getMk_discount_rate() {
		return mk_discount_rate;
	}

	public void setMk_discount_rate(String mk_discount_rate) {
		this.mk_discount_rate = mk_discount_rate;
	}

	public String getMk_thumbImg() {
		return mk_thumbImg;
	}

	public void setMk_thumbImg(String mk_thumbImg) {
		this.mk_thumbImg = mk_thumbImg;
	}

	@Override
	public String toString() {
		return "MealkitDTO [mk_id=" + mk_id + ", mk_name=" + mk_name + ", mk_price=" + mk_price + ", mk_kind=" + mk_kind
				+ ", mk_count=" + mk_count + ", mk_img=" + mk_img + ", mk_content=" + mk_content + ", mk_discount_rate="
				+ mk_discount_rate + ", mk_thumbImg=" + mk_thumbImg + "]";
	}
	
	
		
	
	
	
} // End - public class MealKitDTO
