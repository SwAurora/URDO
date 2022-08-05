package com.korea.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;
import com.korea.service.MemberService;

public class NicknameCneckController implements SubController{

	MemberService service = MemberService.getInstance();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String nickname = req.getParameter("nickname");
		
		PrintWriter out;
		
		if(service.checkNickname(nickname) == 1) {
			try {
				out = resp.getWriter();
				out.print("닉네임 이미 존재합니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				out = resp.getWriter();
				out.print("<div class=\"usable\">사용할 수 있는 닉네임입니다.</div>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
