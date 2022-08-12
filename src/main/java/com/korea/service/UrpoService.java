package com.korea.service;

import java.io.File;
import java.util.List;
import java.util.Objects;

import com.korea.dao.UrpoDAO;
import com.korea.dto.BoardDTO;
import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;

public class UrpoService {
	UrpoDAO dao = new UrpoDAO();
	private static UrpoService instance = null;
	
	public static UrpoService getInstance() {
		if(instance==null) {
			instance = new UrpoService();
		}
		return instance;
	}
	
	// 카테고리 명으로 아이템 목록 보기
	public List<UrpoDTO> ShowItems(String category, int start, int limit) {
		return dao.ShowItems(category, start, limit);
	}
	
	// 카테고리명과 키워드로 아이템 목록 불러오기(검색)
	public List<UrpoDTO> ShowKeywordItems(String category, String keyword, int start, int limit){
		return dao.ShowKeywordItems(category, keyword, start, limit);
	}
	
	// 아이템 목록 리스트로 아이템 목록 보기
	public List<UrpoDTO> ShowItems(String[] nolist) {
		return dao.ShowItems(nolist);
	}
	
	// 아이템 번호로 아이템 찾기
    public UrpoDTO Select(int no) {
        return dao.Select(no);
    }
    
    // 멤버 아이디로 아이템 구매하기
    public boolean purchase(MemberDTO dto, int price, int no) {
        return dao.purchase(dto, price, no);
    }

    // 카테고리로 전체 아이템 수 구하기
	public int getTotalCnt(String category) {
		return dao.getTotalCount(category);
	}
	
	// 카테고리와 키워드로 전체 아이템 수 구하기(검색)
	public int getTotalKeywordCount(String category, String keyword) {
		return dao.getTotalKeywordCount(category, keyword);
	}
}
