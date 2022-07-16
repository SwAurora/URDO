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

    public List<BoardDTO> Select(String table, int start, int limit)
    {
        ArrayList<BoardDTO> list = new ArrayList<>();
        BoardDTO dto;
        String sql = "select * from " + table + " order by no desc limit ?,?";
        try
        {
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
                dto.setContent(rs.getString("comment"));
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

    public int getTotalCount(String table)
    {
        int result = 0;
        String sql = "select count(*) from " + table;
        try
        {
            pstmt = conn.prepareStatement(sql);
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
