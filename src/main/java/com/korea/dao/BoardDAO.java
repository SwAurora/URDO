package com.korea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.korea.dto.BoardDTO;
import com.korea.dto.RecDTO;
import com.korea.dto.ReplyDTO;

public class BoardDAO extends DAO
{
    private static BoardDAO instance;
    DBConnectionMgr pool = DBConnectionMgr.getInstance();

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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
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
    
    // 검색 키워드 포함 boardList
    public List<BoardDTO> Select(String subject, String keyword, int start, int limit) {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            pstmt = conn.prepareStatement("select * from board_tbl where subject = ? and title like ? order by no desc limit ?,?");
            pstmt.setString(1, subject);
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setInt(3, start);
            pstmt.setInt(4, limit);
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
                list.add(dto);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }
    
    // 메인페이지에서 검색
    public List<BoardDTO> SelectMain(String keyword, int start, int limit) {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            pstmt = conn.prepareStatement("select * from board_tbl where title like ? order by no desc limit ?,?");
            pstmt.setString(1, "%" + keyword + "%");
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
                list.add(dto);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }

    public List<BoardDTO> SelectBestNow(int start, int limit)
    {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            Connection conn2 = pool.getConnection();
            PreparedStatement pstmt2;
            ResultSet rs2;

            StringBuilder s = new StringBuilder();
            pstmt2 = conn2.prepareStatement("select board_no from bestnow_tbl order by bestNow_no desc");
            rs2 = pstmt2.executeQuery();
            while(rs2.next())
            {
                s.append(",").append(rs2.getString("board_no"));
            }

            String sql = "select * from board_tbl where no in (select board_no from bestnow_tbl order by bestNow_no desc) order by field(no "+ s +") limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, limit);
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
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
    
    // bestNow 검색
    public List<BoardDTO> SelectBestNow(String keyword, int start, int limit)
    {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            Connection conn2 = pool.getConnection();
            PreparedStatement pstmt2;
            ResultSet rs2;

            StringBuilder s = new StringBuilder();
            pstmt2 = conn2.prepareStatement("select board_no from bestnow_tbl order by bestNow_no desc ");
            rs2 = pstmt2.executeQuery();
            while(rs2.next())
            {
                s.append(",").append(rs2.getString("board_no"));
            }

            String sql = "select * from board_tbl where no in (select board_no from bestnow_tbl order by bestNow_no desc) and title like ? order by field(no "+ s +") limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
                list.add(dto);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }

    public List<BoardDTO> SelectBestMonth(int start, int limit)
    {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            Connection conn2 = pool.getConnection();
            PreparedStatement pstmt2;
            ResultSet rs2;

            StringBuilder s = new StringBuilder();
            pstmt2 = conn2.prepareStatement("select board_no from bestmonth_tbl order by bestMonth_no desc");
            rs2 = pstmt2.executeQuery();
            while(rs2.next())
            {
                s.append(",").append(rs2.getString("board_no"));
            }

            String sql = "select * from board_tbl where no in (select board_no from bestmonth_tbl order by bestMonth_no desc) order by field(no "+ s +") limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, limit);
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
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
    
    // bestMonth 검색
    public List<BoardDTO> SelectBestMonth(String keyword, int start, int limit)
    {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        try
        {
            Connection conn2 = pool.getConnection();
            PreparedStatement pstmt2;
            ResultSet rs2;

            StringBuilder s = new StringBuilder();
            pstmt2 = conn2.prepareStatement("select board_no from bestmonth_tbl order by bestMonth_no desc");
            rs2 = pstmt2.executeQuery();
            while(rs2.next())
            {
                s.append(",").append(rs2.getString("board_no"));
            }

            String sql = "select * from board_tbl where no in (select board_no from bestmonth_tbl order by bestMonth_no desc) and title like ? order by field(no "+ s +") limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,  "%" + keyword + "%");
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
                list.add(dto);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }

    public int getLastNo()
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("ANALYZE TABLE board_tbl");
            pstmt.executeQuery();
            pstmt = conn.prepareStatement("SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'board_tbl' AND table_schema = 'urdo'");
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
    
    public int getTotalCount(String subject, String keyword)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select count(*) from board_tbl where subject = ? and title like ?");
            pstmt.setString(1, subject);
            pstmt.setString(2, "%" + keyword + "%");
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
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return result;
    }
    
    // 전체검색
    public int getTotalCountMain(String keyword)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select count(*) from board_tbl where title like ?");
            pstmt.setString(1, "%" + keyword + "%");
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
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return result;
    }
    
    

    public boolean insert(BoardDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec, filename) values(?,?,?,?,sysdate(),0,0,0,0,?)");
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
            pstmt = conn.prepareStatement("select * from board_tbl where no = ?");
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
                dto.setDay_rec(rs.getInt("day_rec"));
                dto.setMonth_rec(rs.getInt("month_rec"));
                dto.setFilename(rs.getString("filename"));
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

    // --------------------------------------------------------------------------------------------------------------- 게시글 수정 시작
    public void update(BoardDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set title = ?, content = ? where no = ?");
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getNo());
            pstmt.executeUpdate();
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
    }

    public void updateWithFile(BoardDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set title = ?, content = ?, filename = ? where no = ?");
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            if(dto.getFilename().equals(""))
                dto.setFilename(null);
            pstmt.setString(3, dto.getFilename());
            pstmt.setInt(4, dto.getNo());
            pstmt.executeUpdate();
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
    }

    // --------------------------------------------------------------------------------------------------------------- 게시글 수정 끝
    public boolean delete(int no)
    {
        try
        {
            pstmt = conn.prepareStatement("delete from board_tbl where no = ?");
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
    public boolean reply(ReplyDTO rdto)
    {
        try
        {

            Connection conn = pool.getConnection();
            PreparedStatement pstmt;
            // 댓글 작성 SQL
            pstmt = conn.prepareStatement("insert into reply_tbl(boardNo, memberId, writer, content, regdate) values(?,?,?,?,sysdate())");
            pstmt.setInt(1, rdto.getBoardNo());
            pstmt.setString(2, rdto.getMemberId());
            pstmt.setString(3, rdto.getWriter());
            pstmt.setString(4, rdto.getContent());
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

    // 댓글 불러오기 함수
    public ArrayList<ReplyDTO> getReplylist(int bno)
    {
        ArrayList<ReplyDTO> list = new ArrayList<>();
        ReplyDTO dto;
        try
        {
            Connection conn = pool.getConnection();
            PreparedStatement pstmt;
            ResultSet rs;
            pstmt = conn.prepareStatement("select * from reply_tbl where boardNo = ? order by no desc");
            pstmt.setInt(1, bno);
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                dto = new ReplyDTO();
                dto.setNo(rs.getInt("no"));
                dto.setBoardNo(rs.getInt("boardNo"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setWriter(rs.getString("writer"));
                dto.setContent(rs.getString("content"));
                dto.setRegdate(rs.getString("regdate"));
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

    // 댓글 삭제 함수
    public boolean replyDelete(int no)
    {
        try
        {
            pstmt = conn.prepareStatement("delete from reply_tbl where no = ?");
            pstmt.setInt(1, no);
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

    // 조회수 증가
    public void ViewsUp(int no)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set views = views + 1 where no = ?");
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
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
    }

    // 게시글 추천여부 검사
    public int recCheck(RecDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("select board_no from rec_tbl where board_no = ? and rec_id = ?");
            pstmt.setInt(1, dto.getBoard_no());
            pstmt.setString(2, dto.getRec_id());
            rs = pstmt.executeQuery();
            int result = 0;
            while(rs.next())
            {
                result = rs.getInt(1);
            }
            ;
            return result;
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
        return 0;
    }

    // 게시글 추천
    public void recUpdate(RecDTO dto)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into rec_tbl values(?,?)");
            pstmt.setInt(1, dto.getBoard_no());
            pstmt.setString(2, dto.getRec_id());
            pstmt.executeUpdate();
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
    }

    public void recUp(int bno)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set recommend = recommend + 1 where no = ?");
            pstmt.setInt(1, bno);
            pstmt.executeUpdate();
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
    }

    public void dayRecUp(int bno)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set day_rec = day_rec + 1 where no = ?");
            pstmt.setInt(1, bno);
            pstmt.executeUpdate();
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
    }

    public void monthRecUp(int bno)
    {
        try
        {
            pstmt = conn.prepareStatement("update board_tbl set month_rec = month_rec + 1 where no = ?");
            pstmt.setInt(1, bno);
            pstmt.executeUpdate();
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
    }

    public int getDayRec(int bno)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select day_rec from board_tbl where no = ?");
            pstmt.setInt(1, bno);
            rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    public int getMonthRec(int bno)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select month_rec from board_tbl where no = ?");
            pstmt.setInt(1, bno);
            rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    // 게시글 추천수
    public int recCount(int no)
    {
        int count = 0;
        try
        {
            Connection conn = pool.getConnection();
            PreparedStatement pstmt;
            ResultSet rs;
            pstmt = conn.prepareStatement("select recommend from board_tbl where no = ?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                count = rs.getInt(1);
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
        return count;
    }

    // 마이페이지 정보 조회
    public int getMyPost(String nickname)
    {
        try
        {
            pstmt = conn.prepareStatement("select count(*) from board_tbl where writer = ?");
            pstmt.setString(1, nickname);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
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
        return 0;
    }

    public int getMyReply(String id)
    {
        try
        {
            pstmt = conn.prepareStatement("select count(*) from reply_tbl where memberId = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
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
        return 0;
    }

    public int getMyReceivedRec(String nickname)
    {
        try
        {
            pstmt = conn.prepareStatement("select sum(recommend) from board_tbl where writer = ?");
            pstmt.setString(1, nickname);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
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
        return 0;
    }

    public int getMyRec(String id)
    {
        try
        {
            pstmt = conn.prepareStatement("select count(*) from rec_tbl where rec_id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
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
        return 0;
    }

    public void bestNowUp(int bno)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into bestnow_tbl(board_no) value(?)");
            pstmt.setInt(1, bno);
            pstmt.executeUpdate();
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
    }

    public void bestMonthUp(int bno)
    {
        try
        {
            pstmt = conn.prepareStatement("insert into bestmonth_tbl(board_no) value(?)");
            pstmt.setInt(1, bno);
            pstmt.executeUpdate();
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
    }

    public int getBestNowTotalCount()
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select count(*) from bestnow_tbl");
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
    
    // BestNow 검색 Count
    public int getBestNowTotalCount(String keyword)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("SELECT count(*) FROM board_tbl WHERE no = (SELECT board_no FROM bestnow_tbl) and title like ?");
            pstmt.setString(1, "%" + keyword + "%");
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

    public int getBestMonthTotalCount()
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("select count(*) from bestmonth_tbl");
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
    
    // bestMonth 검색 cnt
    public int getBestMonthTotalCount(String keyword)
    {
        int result = 0;
        try
        {
            pstmt = conn.prepareStatement("SELECT count(*) FROM board_tbl WHERE no = (SELECT board_no FROM bestmonth_tbl) and title like ?");
            pstmt.setString(1, "%" + keyword + "%");
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
}