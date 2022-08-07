package com.korea.service;

import org.mindrot.jbcrypt.BCrypt;

import com.korea.dao.AdminDAO;
import com.korea.dto.AdminLoginDTO;

public class adminService {
	
	AdminDAO dao = AdminDAO.getInstance();
		
	private static adminService instance;
	
	
	
	
	public static adminService getInstance() {
		if (instance==null) {
			instance = new adminService();
		}
		return instance;
	}
	
	
	private adminService() {}
	
	
	
	
//	public AdminLoginDTO AdminSearch())
//	{
//		return dao.Select();
//	}
	
	
	

}
