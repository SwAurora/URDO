package com.korea.dao;

import com.korea.dto.BoardDTO;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DAO
{
    private static BoardDAO instance;

    public static BoardDAO getInstance()
    {
        if(instance == null)
        {
            instance = new BoardDAO();
        }
        return instance;
    }

    private BoardDAO()
    {

    }

    public List<BoardDTO> Select(String subject, int start, int limit)
    {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            pstmt = conn.prepareStatement("select * from board_tbl where subject = ? order by no desc limit ?,?");
            pstmt.setString(1, subject);
            pstmt.setInt(2, start);
            pstmt.setInt(3, limit);
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                dto = new BoardDTO();
                dto.setNo(rs.getInt("no"));
                dto.setSubject(rs.getString("subject"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setWriter(rs.getString("writer"));
                dto.setDate(rs.getString("date"));
                dto.setViews(rs.getInt("views"));
                dto.setRecommend(rs.getInt("recommend"));
                dto.setFilename(rs.getString("filename"));
                dto.setAvailable(rs.getInt("available"));
                list.add(dto);
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
        return list;
    }

    public int getTotalCount(String subject)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select count(*) from board_tbl where subject = ?");
            pstmt.setString(1, subject);
            rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);
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
        return result;
    }

    public boolean insert(BoardDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into board_tbl(subject, title, content, writer, date, views, recommend, filename, available) values(?,?,?,?,sysdate(),0,0,?,1)");
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getWriter());
            pstmt.setString(5, dto.getFilename());

            int result = pstmt.executeUpdate();
            if(result > 0)
                return true;
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
    
    // 게시글 번호로 게시글 불러오기
    public BoardDTO Select(int No) {
    	BoardDTO dto = new BoardDTO();
    	try {
    		pstmt = conn.prepareStatement("select * from tbl_board where no = ?");
    		pstmt.setInt(1, No);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			dto.setWriter(rs.getString("writer"));
    			dto.setContent(rs.getString("content"));
    			dto.setTitle(rs.getString("title"));
    			dto.setNo(rs.getInt("no"));
    			dto.setFilename(rs.getString("filename"));
    			dto.setDate(rs.getString("date"));
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
    		try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
    	}
    	return dto;
    }
}