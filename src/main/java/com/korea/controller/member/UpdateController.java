package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateController implements SubController
{
    MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String email = req.getParameter("email");
        String nickname = req.getParameter("nickname");
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");

        if(!email.equals(""))
        {
            try
            {
                boolean result = service.UpdateEmail(id, email);
                resp.sendRedirect("/ShowInfo.do?result=" + result);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {

        }
        
        if(!nickname.equals(""))
        {
            try
            {
                boolean result = service.UpdateNickName(id, nickname);
                resp.sendRedirect("/ShowInfo.do?result=" + result);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
        }
    }
}
