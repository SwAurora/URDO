package com.korea.dao;

import com.korea.dto.UrpoDTO;

public class UrpoDAO extends DAO{
	private static UrpoDAO instance;
	public static UrpoDAO getInstance() {
		if(instance == null) {
			instance = new UrpoDAO();
		}
		return instance;
	}
    public boolean insert(UrpoDTO dto) {
        try {
            pstmt = conn.prepareStatement("insert into pointshop_tbl values(?,?,'설명은생략한다',?,'gifImage',?,?)");
            pstmt.setString(1, dto.getProducer());
            pstmt.setString(2, dto.getTitle());
            pstmt.setInt(3, dto.getPrice());
            pstmt.setString(4,dto.getStaticImage());
            pstmt.setString(5, dto.getCategory());
            int result = pstmt.executeUpdate();
            if(result > 0) {
                return true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        
        return false;
    }
}
