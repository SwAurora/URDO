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
            pstmt = conn.prepareStatement("insert into member_tbl(id, pw, email, nickname, point, grade) values(?,?,?,?,0,0)");
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
                dto.setIcon(rs.getInt("icon"));
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
    
    // 멤버 정보에 댓글아이콘 등록하기
    public boolean replyIcon(int no, String id) {
        try {
            pstmt = conn.prepareStatement("update member_tbl set icon = ? where id = ?");
            pstmt.setInt(1, no);
            pstmt.setString(2, id);
            int result = pstmt.executeUpdate();
            if(result > 0) {
                return true;
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return false;
    }
    
    // 포인트 증가
    public boolean getPoint(int no, String id) {
        try {
            pstmt = conn.prepareStatement("update member_tbl set point = point + ? where id = ?");
            pstmt.setInt(1, no);
            pstmt.setString(2, id);
            int result = pstmt.executeUpdate();
            if(result > 0) {
                return true;
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return false;
    }
    
    // 아이디 중복 체크
    public int checkId(String id) {
    	int i = 0; // 아이디 개수 초기화
    	try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM member_tbl where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
            if(rs.next())
            {
            	i = rs.getInt(1);
                return i;
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        } return 0;
    }
    
    // 닉네임 중복체크
    public int checkNickname(String nickname) {
    	int i = 0; // 아이디 개수 초기화
    	try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM member_tbl where nickname = ?");
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
            if(rs.next())
            {
            	i = rs.getInt(1);
                return i;
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        } return 0;
    }
    /*
	public int checkEmail(String email) {
    	int i = 0; // 이메일 개수 초기화
    	try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM member_tbl where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
            if(rs.next())
            {
            	i = rs.getInt(1);
                return i;
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        } return 0;
	}
	*/
	
    public String checkEmail(String email)
    {
        String result = "";
        try
        {
            pstmt = conn.prepareStatement("select email from member_tbl where email = ?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            rs.next();
            result = rs.getString(1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }
}
