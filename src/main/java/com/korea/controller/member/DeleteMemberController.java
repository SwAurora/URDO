package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteMemberController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        MemberService service = MemberService.getInstance();
        String pwd = req.getParameter("delpw");

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");
        MemberDTO dto = service.MemberSearch(id);
        String pw = dto.getPw();

        if(BCrypt.checkpw(pwd, pw))
        {
            try
            {
                boolean result = service.DeleteMember(id);
                if(result)
                {
                    session.invalidate();
                    req.setAttribute("msg", "그 동안 이용해주셔서 감사합니다.");
                    req.getRequestDispatcher("/main.do").forward(req, resp);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            try
            {
                req.setAttribute("msg", "잘못된 비밀번호 입니다.");
                req.getRequestDispatcher("/ShowInfo.do").forward(req, resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
