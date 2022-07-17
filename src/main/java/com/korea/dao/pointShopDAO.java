package com.korea.dao;

import com.korea.dto.MemberDTO;
import com.korea.dto.PointShopDTO;

public class pointShopDAO extends DAO{
	private static pointShopDAO instance;

    public static pointShopDAO getInstance() {
        if(instance == null) {
            instance = new pointShopDAO();
        }
        return instance;
    }

    private pointShopDAO() {}
    
    public PointShopDTO Select()
    {
    	PointShopDTO dto = new PointShopDTO();
        try
        {
            pstmt = conn.prepareStatement("select * from member_tbl where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next())
            {
                dto.setId(id);
                dto.setPw(rs.getString("pw"));
                dto.setEmail(rs.getString("email"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPoint(rs.getInt("point"));
                dto.setGrade(rs.getInt("grade"));
                return dto;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                rs.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            try
            {
                pstmt.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return null;
    }
}
