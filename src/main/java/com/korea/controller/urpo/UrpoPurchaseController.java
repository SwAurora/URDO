package com.korea.controller.urpo;

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
		System.out.println("서비스 진입 성공!");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int price = Integer.parseInt(req.getParameter("price"));
		
		req.setAttribute("dto", dto);
		
		if(id==null) {
			System.out.println("로그인을 먼저 해 주세요.");
		} else if(mdto.getPoint() <price) {
			System.out.println("포인트가 부족합니다.");
		} else {
			mdto = mservice.MemberSearch(id);
			service.purchase(id, price);
		}
		
	}

}
