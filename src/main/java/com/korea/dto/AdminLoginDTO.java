package com.korea.dto;

import lombok.Data;

@Data
public class AdminLoginDTO {
	
	private String id;
	private String pwd;
	private int grade;
	
	public AdminLoginDTO() {
		grade=3; 
	}
	
	

}
