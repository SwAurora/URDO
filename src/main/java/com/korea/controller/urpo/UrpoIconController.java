package com.korea.controller.urpo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.service.MemberService;

public class UrpoIconController implements SubController{
	MemberService service = MemberService.getInstance();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int no = Integer.parseInt(req.getParameter("replyIcon"));
		service.replyIcon(no, id);
		try {
			req.setAttribute("msg", "아이콘 변경에 성공했습니다.");
	        req.getRequestDispatcher("/ShowInfo.do").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}
