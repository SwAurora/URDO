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

public class ReplyListController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String bno = req.getParameter("bno");
        ArrayList<ReplyDTO> list = service.getReplylist(Integer.parseInt(bno));
		HttpSession session = req.getSession();
		String nickname = (String) session.getAttribute("nickname");
		
        try
        {
            PrintWriter out = resp.getWriter();
            for(ReplyDTO rdto : list)
            {
                out.print("<tr>");
                out.print("<td class=\"replyCol1\"><img src=\"/resources/img/board/frog.png\"></td>");
                out.print("<td class=\"replyCol2\">" + rdto.getWriter() + " (" + rdto.getRegdate() + ")</td>");
                out.print("<td class=\"replyCol3\">" + rdto.getContent() + "</td>");
                if(rdto.getWriter().equals(nickname)) {
                	out.print("<td class=\"replyCol4\"><a href=\"javascript:replydelete("+rdto.getNo()+")\" class=\"replyDeleteBtn\">X</a></td>");
                }
                out.print("</tr>");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
