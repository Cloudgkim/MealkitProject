package com.edu.mealkit.dto;

import java.sql.Timestamp;
import java.util.Date;

public class BuyDTO {
	
	private String order_id; // 주문 고유번호
	private int buy_id; // 고유번호
	private String member_id; // 회원 아이디
	private int buy_count;
	private int buy_price;
	private String mk_name;
	private int 	mk_id;
	private Timestamp buy_date;
	private String delivery_name;
	private String delivery_tel;
	private String delivery_address;
	private String delivery;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public String getMk_name() {
		return mk_name;
	}
	public void setMk_name(String mk_name) {
		this.mk_name = mk_name;
	}
	public int getMk_id() {
		return mk_id;
	}
	public void setMk_id(int mk_id) {
		this.mk_id = mk_id;
	}
	public Timestamp getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	public String getDelivery_name() {
		return delivery_name;
	}
	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}
	public String getDelivery_tel() {
		return delivery_tel;
	}
	public void setDelivery_tel(String delivery_tel) {
		this.delivery_tel = delivery_tel;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	@Override
	public String toString() {
		return "BuyDTO [order_id=" + order_id + ", buy_id=" + buy_id + ", member_id=" + member_id + ", buy_count="
				+ buy_count + ", buy_price=" + buy_price + ", mk_name=" + mk_name + ", mk_id=" + mk_id + ", buy_date="
				+ buy_date + ", delivery_name=" + delivery_name + ", delivery_tel=" + delivery_tel
				+ ", delivery_address=" + delivery_address + ", delivery=" + delivery + "]";
	}
	
	
	
	
	
} // end class BuyDTO
