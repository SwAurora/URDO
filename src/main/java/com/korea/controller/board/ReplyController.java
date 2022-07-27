package com.korea.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;

public class ReplyController implements SubController{
	BoardService service = BoardService.getInstance();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String nickname = (String) session.getAttribute("nickname");
		
		String comment = req.getParameter("comment");
		String bno = req.getParameter("bno");
		
		ReplyDTO rdto = new ReplyDTO();
		rdto.setBoardNo(Integer.parseInt(bno));
		rdto.setWriter(nickname);
		rdto.setContent(comment);
		
		// 서비스 실행
		service.reply(rdto);
	}

}
