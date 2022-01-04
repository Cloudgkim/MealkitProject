package com.edu.board.domain;

public class BoardKindDTO {
	
	private String	b_kind_id;
	private String	b_kind_name;
	
	public String getB_kind_id() {
		return b_kind_id;
	}
	public void setB_kind_id(String b_kind_id) {
		this.b_kind_id = b_kind_id;
	}
	public String getB_kind_name() {
		return b_kind_name;
	}
	public void setB_kind_name(String b_kind_name) {
		this.b_kind_name = b_kind_name;
	}
	
	@Override
	public String toString() {
		return "BoardKindDTO [b_kind_id=" + b_kind_id + ", b_kind_name=" + b_kind_name + "]";
	}

} // end class BoardKindDTO
