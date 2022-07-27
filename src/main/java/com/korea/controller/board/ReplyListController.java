package com.korea.controller.board;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;

public class ReplyListController implements SubController{
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		BoardService service = BoardService.getInstance();
		HttpSession session = req.getSession();
		BoardDTO dto = (BoardDTO) session.getAttribute("dto");
		ArrayList<ReplyDTO> list = service.getReplylist(dto.getNo());
		try {
			PrintWriter out = resp.getWriter();
			for(int i=0; i<list.size(); i++) {
				out.print("<tr>");
				out.print("<td scope=\"col\"><img src=\"/resources/img/board/frog.png\"></td>");
				out.print("<td scope=\"col\">"+ list.get(i).getWriter() +" (" + list.get(i).getRegdate()+ ")</td>");
				out.print("<td scope=\"col\">"+ list.get(i).getContent() +"</td>");
				out.print("<td>삭제</td>");
				out.print("</tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
