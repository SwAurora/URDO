package com.korea.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;
import com.korea.service.MemberService;

public class EmailCheckController implements SubController{
	MemberService service = MemberService.getInstance();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");
		
		PrintWriter out;
		
		if(service.checkEmail(email) == 1) {
			try {
				out = resp.getWriter();
				out.print("이메일이 이미 존재합니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				out = resp.getWriter();
				out.print("");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
