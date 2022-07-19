package com.korea.controller.auth;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController implements SubController
{
    MemberService service = MemberService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");

        try
        {
            if(id == null || pw == null)
            {
                resp.sendRedirect("/login.jsp");
            }

            MemberDTO dto = service.MemberSearch(id);
            if(dto != null)
            {
                if(BCrypt.checkpw(pw, dto.getPw()))
                {
                    HttpSession session = req.getSession();
                    session.setAttribute("id", dto.getId());
                    session.setAttribute("nickname", dto.getNickname());
                    session.setAttribute("grade", dto.getGrade());
                    session.setMaxInactiveInterval(60*60); // 세션 유지 시간 60분
                    // View로 이동
                    resp.sendRedirect("/");
                }
                else
                {
                    req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            }
            else
            {
                req.setAttribute("msg", "일치하는 아이디가 없습니다.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
