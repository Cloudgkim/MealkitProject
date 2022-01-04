package com.edu.mealkit.dto;


//-----------------------------------------------------------------------------------------------------------
//public class MealKitKindDTO
//-----------------------------------------------------------------------------------------------------------
//@Getter
//@Setter
//@ToString
public class MealkitKindDTO {

	private String	kind_id;
	private String	kind_name;
	private int  kind_count;
	
	public int getKind_count() {
		return kind_count;
	}
	public void setKind_count(int kind_count) {
		this.kind_count = kind_count;
	}
	public String getKind_id() {
		return kind_id;
	}
	public void setKind_id(String kind_id) {
		this.kind_id = kind_id;
	}
	public String getKind_name() {
		return kind_name;
	}
	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}
	@Override
	public String toString() {
		return "MealkitKindDTO [kind_id=" + kind_id + ", kind_name=" + kind_name + ", kind_count=" + kind_count + "]";
	}
	
	
	
}
