package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PwdUpdateController implements SubController
{
    MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String new_pw = req.getParameter("new_pw");
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");

        new_pw = BCrypt.hashpw(new_pw, BCrypt.gensalt());
        boolean result = service.UpdatePassword(id, new_pw);

        try
        {
            resp.sendRedirect("/ShowInfo.do?result=" + result);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
}
