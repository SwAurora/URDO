package com.korea.controller.admin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;

import java.io.IOException;

public class AdminController extends HttpServlet
{
	MemberService service = MemberService.getInstance();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
    	HttpSession session = req.getSession();
    	String id = (String) session.getAttribute("id");
    	if(id == null)
    	{
    		try
    		{
    			req.setAttribute("msg", "접근 권한이 없습니다.");
    			req.getRequestDispatcher("/main.do").forward(req, resp);
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    	}
    	else
    	{
    		MemberDTO dto = service.MemberSearch(id);
    		if(dto.getGrade() != 1)
    		{
    			try
        		{
        			req.setAttribute("msg", "접근 권한이 없습니다.");
        			req.getRequestDispatcher("/main.do").forward(req, resp);
        		}
        		catch(Exception e)
        		{
        			e.printStackTrace();
        		}
    		}
    		else
    		{
    			req.getRequestDispatcher("/WEB-INF/admin/adminMain.jsp").forward(req, resp);
    		}
    	}
    }
}
