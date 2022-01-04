package com.edu.mealkit.dto;

public class CartDTO {
	private		int				cart_id;
	private		String			buy_id;
	private		int				mk_id;
	private		String			mk_name;
	private		int				buy_price;
	private		String 			mk_img;
	private		int				buy_count;

	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public String getMk_img() {
		return mk_img;
	}
	public void setMk_img(String mk_img) {
		this.mk_img = mk_img;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", buy_id=" + buy_id + ", mk_id=" + mk_id + ", mk_name=" + mk_name
				+ ", buy_price=" + buy_price + ", mk_img=" + mk_img + ", buy_count=" + buy_count ;
	}
	
	
}
