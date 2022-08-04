package com.korea.controller.board;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.dto.ReplyDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.BoardService;
import com.korea.service.MemberService;
import com.korea.service.UrpoService;

public class ReplyListController implements SubController
{
    BoardService service = BoardService.getInstance();
    MemberService mservice = MemberService.getInstance();
    UrpoService uservice = UrpoService.getInstance();
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
            	MemberDTO dto = mservice.MemberSearch(rdto.getMemberId());
            	UrpoDTO udto = uservice.Select(dto.getIcon());
                out.print("<tr>");
                out.print("<td class=\"replyCol1\"><img src="+udto.getGifImage()+" style=\"background-color:white\"></td>");
                out.print("<td class=\"replyCol2\">" + rdto.getWriter() + "<br>(" + rdto.getRegdate() + ")</td>");
                out.print("<td class=\"replyCol3\">" + rdto.getContent() + "</td>");
                if(rdto.getWriter().equals(nickname)) {
                	out.print("<td class=\"replyCol4\"><a href=\"javascript:replydelete("+rdto.getNo()+")\" class=\"replyDeleteBtn\">X</a></td>");
                }
                out.print("</tr>");
                out.print("<tr>");
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
