package com.korea.test;


import org.junit.Test;

import com.korea.dao.BoardDAO;
import com.korea.dto.BoardDTO;

class DAOtest {

	@Test
	void test() {
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.Select(503);
		System.out.println("실행!!");
		System.out.println(dto);
	}

}
