package com.korea.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.korea.controller.SubController;
import com.korea.dto.AdminLoginDTO;
import com.korea.service.MemberService;
import com.korea.service.adminService;

public class AdminLoginController implements SubController {
	
	adminService service = adminService.getInstance();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	System.out.println("adminLogin");
				
			try {
				String id = req.getParameter("id");
				String pwd = req.getParameter("pwd");
				
				System.out.println("id: " + id + "pw : " + pwd);
				
				if(id==null || pwd==null) 
				{
					resp.sendRedirect("/adminLogin.jsp");
				}
				
//				AdminLoginDTO dto = service.AdminSearch(id);
				
				AdminLoginDTO dto = new AdminLoginDTO();
				
				if(dto!=null) {
					if(pwd==dto.getPwd()) {
						HttpSession session = req.getSession();
						session.setAttribute("id", dto.getId());
						session.setAttribute("grade", dto.getGrade());
						session.setMaxInactiveInterval(60*60);
							
						resp.sendRedirect("/dashBoard.jsp"); 						
											
					}
					else {
					   req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
	                   req.getRequestDispatcher("/adminLogin.jsp").forward(req, resp);
					}

				}
				else {
					 req.setAttribute("msg", "일치하는 아이디가 없습니다.");
	                 req.getRequestDispatcher("/adminLogin.jsp").forward(req, resp);
				}
				
				
				
				
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
