package com.korea.controller.urpo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.MemberService;
import com.korea.service.UrpoService;

public class UrpoPurchaseController implements SubController{
	
	UrpoService service = UrpoService.getInstance();
	MemberService mservice = MemberService.getInstance();
	UrpoDTO dto = new UrpoDTO();
	MemberDTO mdto = new MemberDTO();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int price = Integer.parseInt(req.getParameter("price"));
		req.setAttribute("dto", dto);
		
		if(id==null) {
			try {
				req.setAttribute("msg", "로그인을 먼저 해 주세요");
				req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(mdto.getPoint() <price) {
			req.setAttribute("msg", "포인트가 부족합니다.");
			try {
				req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			mdto = mservice.MemberSearch(id);
			service.purchase(id, price);
		}
		
	}

}
