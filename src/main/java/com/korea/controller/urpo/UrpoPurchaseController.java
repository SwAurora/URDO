package com.korea.controller.urpo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.service.UrpoService;

public class UrpoPurchaseController implements SubController{
	
	UrpoService service = UrpoService.getInstance();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("서비스 진입 성공!");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int price = Integer.parseInt(req.getParameter("price"));
		service.purchase(id, price);
		
		
	}

}
