package com.korea.dao;

import java.util.ArrayList;
import java.util.List;

import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;

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
            pstmt = conn.prepareStatement("select * from board_tbl where subject = ? and available = 1 order by no desc limit ?,?");
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

    public int getLastNo()
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select no from board_tbl order by no desc;");
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

    public int getTotalCount(String subject)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select count(*) from board_tbl where subject = ? and available = 1");
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
    public BoardDTO Select(int no)
    {
        BoardDTO dto = new BoardDTO();
        try
        {
            pstmt = conn.prepareStatement("select * from board_tbl where no = ? and available = 1");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while(rs.next())
            {
                dto.setNo(rs.getInt("no"));
                dto.setSubject(rs.getString("subject"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setDate(rs.getString("date"));
                dto.setWriter(rs.getString("writer"));
                dto.setViews(rs.getInt("views"));
                dto.setRecommend(rs.getInt("recommend"));
                dto.setFilename(rs.getString("filename"));
                dto.setAvailable(rs.getInt("available"));
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
        return dto;
    }

    public boolean delete(int no)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set available = 0 where no = ?");
            pstmt.setInt(1, no);

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
    
    // 댓글 등록 함수
    public boolean reply(ReplyDTO rdto) {
    	try {
            pstmt = conn.prepareStatement("insert into reply_tbl(boardNo, writer, content, regdate) values(?,?,?, sysdate())");
            pstmt.setInt(1, rdto.getBoardNo());
            pstmt.setString(2, rdto.getWriter());
            pstmt.setString(3, rdto.getContent());
            int result = pstmt.executeUpdate();
            if(result > 0)  return true;
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return false;
    }
    
    // 댓글 불러오기 함수
    public ArrayList<ReplyDTO> getReplylist(int bno) {
    	ArrayList<ReplyDTO> list = new ArrayList();
    	ReplyDTO dto = null;
    	try {
    		pstmt = conn.prepareStatement("select * from reply_tbl where boardNo = ? order by no desc");
    		pstmt.setInt(1, bno);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			dto = new ReplyDTO();
    			dto.setNo(rs.getInt("no"));
    			dto.setBoardNo(rs.getInt("boardNo"));
    			dto.setContent(rs.getString("content"));
    			dto.setContent(rs.getString("content"));
    			dto.setWriter(rs.getString("writer"));
    			dto.setRegdate(rs.getString("regdate"));
    			list.add(dto);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
    		try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
    	}
    	return list;
    }
    
}
