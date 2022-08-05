package com.korea.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;
import com.korea.service.MemberService;

public class ReplyController implements SubController{
	BoardService service = BoardService.getInstance();
	MemberService mservice = MemberService.getInstance();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String nickname = (String) session.getAttribute("nickname");
		String id = (String) session.getAttribute("id");
		
		String comment = req.getParameter("comment");
		String bno = req.getParameter("bno");
		
		ReplyDTO rdto = new ReplyDTO();
		rdto.setBoardNo(Integer.parseInt(bno));
		rdto.setMemberId(id);
		rdto.setWriter(nickname);
		rdto.setContent(comment);

		// 댓글 등록
		service.reply(rdto);
		
		// 포인트 증가
		mservice.getPoint(1, id);
	}

}
