package com.korea.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;

public class ReplyDeleteController implements SubController{
	BoardService service = BoardService.getInstance();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("컨트롤러 실행 됨!");
		HttpSession session = req.getSession();
		String nickname = (String) session.getAttribute("nickname");
		int rno = Integer.parseInt(req.getParameter("rno"));
		System.out.println(rno);
		service.replyDelete(rno);
	}

}
