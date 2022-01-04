package com.edu.mealkit.dto;

public class ManagerDTO {
	
	private String manager_id;
	private String manager_password;
	
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_password() {
		return manager_password;
	}
	public void setManager_password(String manager_password) {
		this.manager_password = manager_password;
	}
	
	@Override
	public String toString() {
		return "ManagerDTO [manager_id=" + manager_id + ", manager_password=" + manager_password + "]";
	}

}
