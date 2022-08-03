package com.korea.controller.urpo;

import java.util.ArrayList;
import java.util.List;

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
		int no = Integer.parseInt(req.getParameter("no"));
		int price = Integer.parseInt(req.getParameter("price"));
		req.setAttribute("dto", dto);
		
		// 해당 아이디 회원 정보를 dto 형태로 불러왔음. UrpoDTO와 구분하기 위해 mdto사용
		mdto = mservice.MemberSearch(id);
		
		// 아이템 구매여부 확인 플래그 exist
		String[] nolist = mdto.getItems().split(";");
		boolean exist = false;
		for(int i=0; i<nolist.length; i++) {
			if(nolist[i].contains(no + "")) {
				exist = true;
			} 
		}
		
		
		// 로그인, 포인트 잔액, 구매여부 검증
		if(id==null) {
			try {
				req.setAttribute("msg", "로그인을 먼저 해 주세요");
				req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(mdto.getPoint() < price) {
			System.out.println("잔액 : " + mdto.getPoint());
			req.setAttribute("msg", "포인트가 부족합니다. 남은 포인트 : " +mdto.getPoint());
			try {
				req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(exist) {
			req.setAttribute("msg", "동일한 아이템을 이미 구매하셨습니다.");
			try {
				req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			service.purchase(mdto, price, no);
			int remains = mdto.getPoint() - price;
			req.setAttribute("msg", "구매 성공! 남은 포인트 : " + remains);
			try {
				req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
