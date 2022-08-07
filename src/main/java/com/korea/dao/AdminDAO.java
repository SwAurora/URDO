package com.korea.dao;

import java.sql.SQLException;

import com.korea.dto.AdminLoginDTO;

public class AdminDAO extends DAO {
	
	private static AdminDAO instance;
	public static AdminDAO getInstance() {
		if(instance==null)
			instance = new AdminDAO();
		return instance;
	}
	
	public boolean Select() {
		
		AdminLoginDTO dto = new AdminLoginDTO();
		
		try {
						
			pstmt = conn.prepareStatement("select id, pwd, grade from adminlogin");
					
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setGrade(rs.getInt("grade"));
								
				return true; 		
			}			
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e) {e.printStackTrace();}
			try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
		}
		return false;
	}
	
	
	
	
	

}
