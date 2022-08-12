package com.korea.dao;

import java.util.ArrayList;
import java.util.List;

import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;

public class UrpoDAO extends DAO
{
    private static UrpoDAO instance;

    public static UrpoDAO getInstance()
    {
        if(instance == null)
        {
            instance = new UrpoDAO();
        }
        return instance;
    }


    // 카테고리로 아이템 불러오기
    public List<UrpoDTO> ShowItems(String category, int start, int limit)
    {
        ArrayList<UrpoDTO> list = new ArrayList<>();
        UrpoDTO dto;
        try {
            pstmt = conn.prepareStatement("select * from urpo_tbl where category = ? order by no desc limit ?, ?");
            pstmt.setString(1, category);
            pstmt.setInt(2, start);
            pstmt.setInt(3, limit);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                dto = new UrpoDTO();
                dto.setNo(rs.getInt("no"));
                dto.setTitle(rs.getString("title"));
                dto.setDiscription(rs.getString("discription"));
                dto.setPrice(rs.getInt("price"));
                dto.setStaticImage(rs.getString("staticImage"));
                dto.setGifImage(rs.getString("gifImage"));
                dto.setCategory(rs.getString("category"));
                dto.setProducer(rs.getString("producer"));
                list.add(dto);
            }
        } catch(Exception e)
        {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }
    
    // 카테고리와 키워드로 아이템 불러오기(검색기능)
    public List<UrpoDTO> ShowKeywordItems(String category, String keyword, int start, int limit)
    {
        ArrayList<UrpoDTO> list = new ArrayList<>();
        UrpoDTO dto;
        try {
            pstmt = conn.prepareStatement("select * from urpo_tbl where category = ? and title like ? order by no desc limit ?, ?");
            pstmt.setString(1, category);
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setInt(3, start);
            pstmt.setInt(4, limit);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                dto = new UrpoDTO();
                dto.setNo(rs.getInt("no"));
                dto.setTitle(rs.getString("title"));
                dto.setDiscription(rs.getString("discription"));
                dto.setPrice(rs.getInt("price"));
                dto.setStaticImage(rs.getString("staticImage"));
                dto.setGifImage(rs.getString("gifImage"));
                dto.setCategory(rs.getString("category"));
                dto.setProducer(rs.getString("producer"));
                list.add(dto);
            }
        } catch(Exception e)
        {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }
    
    // 아이템 번호 리스트로 아이템 불러오기
    public List<UrpoDTO> ShowItems(String[] nolist) {
        ArrayList<UrpoDTO> list = new ArrayList<>();
        UrpoDTO dto;
        try {
            pstmt = conn.prepareStatement("select * from urpo_tbl where no = ? order by no desc");
            for(int i=0; i<nolist.length; i++) {
            	pstmt.setString(1, nolist[i]);
            	rs = pstmt.executeQuery();
            	while(rs.next()) {
            		dto = new UrpoDTO();
            		dto.setNo(rs.getInt("no"));
            		dto.setTitle(rs.getString("title"));
            		dto.setDiscription(rs.getString("discription"));
            		dto.setPrice(rs.getInt("price"));
            		dto.setStaticImage(rs.getString("staticImage"));
            		dto.setGifImage(rs.getString("gifImage"));
            		dto.setCategory(rs.getString("category"));
            		dto.setProducer(rs.getString("producer"));
            		list.add(dto);
            	}

            }
        } catch(Exception e)
        {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return list;
    }

    // 아이템 번호로 아이템 정보 불러오기
    public UrpoDTO Select(int no) {
        UrpoDTO dto = new UrpoDTO();
        try {
            pstmt = conn.prepareStatement("select * from urpo_tbl where no = ?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while(rs.next())
            {
                dto.setNo(rs.getInt("no"));
                dto.setTitle(rs.getString("title"));
                dto.setDiscription(rs.getString("discription"));
                dto.setPrice(rs.getInt("price"));
                dto.setStaticImage(rs.getString("staticImage"));
                dto.setGifImage(rs.getString("gifImage"));
                dto.setCategory(rs.getString("category"));
                dto.setProducer(rs.getString("producer"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return dto;
    }

    // 멤버 아이디로 아이템 구매하기
    public boolean purchase(MemberDTO dto, int price, int no) {
        try {
            String items = dto.getItems() + no + ";";
            pstmt = conn.prepareStatement("update member_tbl set point = point - ?, items =? where id = ?");
            pstmt.setInt(1, price);
            pstmt.setString(2, items);
            pstmt.setString(3, dto.getId());
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

    // 카테고리로 전체아이템 수 계산하기
    public int getTotalCount(String category)
    {
        int result = 0;
        try {
            pstmt = conn.prepareStatement("select count(*) from urpo_tbl where category = ?");
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return result;
    }
    
    // 카테고리와 키워드로 전체아이템 수 계산하기
    public int getTotalKeywordCount(String category, String keyword)
    {
        int result = 0;
        try {
            pstmt = conn.prepareStatement("select count(*) from urpo_tbl where category = ? and title like ?");
            pstmt.setString(1, category);
            pstmt.setString(2, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
            try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
        }
        return result;
    }
    

}
