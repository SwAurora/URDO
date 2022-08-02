package com.korea.dao;

import com.korea.dto.MemberDTO;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.SQLException;

public class MemberDAO extends DAO
{
    private static MemberDAO instance;

    public static MemberDAO getInstance()
    {
        if(instance == null)
        {
            instance = new MemberDAO();
        }
        return instance;
    }

    private MemberDAO()
    {

    }

    public boolean insert(MemberDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into member_tbl values(?,?,?,?,0,0,null)");
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPw());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getNickname());

            int result = pstmt.executeUpdate();

            if(result > 0)
            {
                return true;
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
                pstmt.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return false;
    }

    public MemberDTO Select(String id)
    {
        MemberDTO dto = new MemberDTO();
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
                dto.setItems(rs.getString("items"));
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

    public boolean UpdateEmail(String id, String email)
    {
        try
        {
            pstmt = conn.prepareStatement("update member_tbl set email = ? where id = ?");
            pstmt.setString(1, email);
            pstmt.setString(2, id);
            int result = pstmt.executeUpdate();
            if(result > 0)
                return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean UpdateNickName(String id, String nickname)
    {
        try
        {
            pstmt = conn.prepareStatement("update  member_tbl set nickname = ? where id = ?");
            pstmt.setString(1, nickname);
            pstmt.setString(2, id);
            int result = pstmt.executeUpdate();
            if(result > 0)
                return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean UpdatePassword(String id, String password)
    {
        try
        {
            pstmt = conn.prepareStatement("update member_tbl set pw = ? where  id = ?");
            pstmt.setString(1, password);
            pstmt.setString(2, id);
            int result = pstmt.executeUpdate();
            if(result > 0)
                return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean DeleteMember(String id)
    {
        String sql = "delete from member_tbl where id=?";
        try
        {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            int result = pstmt.executeUpdate();
            if(result > 0)
            {
                return true;
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
                pstmt.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }

        }
        return false;
    }
}
