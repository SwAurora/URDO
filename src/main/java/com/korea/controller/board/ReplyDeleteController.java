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
		
	}

}
