package com.edu.mealkit.dto;

public class ZzimDTO {
	
	private int zzim_id;    //찜한목록의 고유번호(자동증가)
	private String buy_id;  //찜한 인간이름
	private int mk_id;      //밀키트목록의고유번호
	private String mk_name; //밀키트이름
	private int mk_price; //밀키트상품 가격
	private String mk_img;      //밀키트이미지
	
	public int getZzim_id() {
		return zzim_id;
	}
	public void setZzim_id(int zzim_id) {
		this.zzim_id = zzim_id;
	}
	public String getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}
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
	public String getMk_img() {
		return mk_img;
	}
	public void setMk_img(String mk_img) {
		this.mk_img = mk_img;
	}
	@Override
	public String toString() {
		return "ZzimDTO [zzim_id=" + zzim_id + ", buy_id=" + buy_id + ", mk_id=" + mk_id + ", mk_name=" + mk_name
				+ ", mk_price=" + mk_price + ", mk_img=" + mk_img + "]";
	}

    
	
}
