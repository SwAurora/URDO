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
	/*
	public boolean ProduceUrcon(UrpoDTO dto){
		return dao.insert(dto);
	}
	*/
	
	// 카테고리 명으로 아이템 목록 보기
	public List<UrpoDTO> ShowItems(String category, int start, int limit) {
		return dao.ShowItems(category, start, limit);
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

	public int getTotalCnt(String category) {
		return dao.getTotalCount(category);
	}
}
