package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowInfoController implements SubController
{
    MemberService service = MemberService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {

        // view 로 이동
        try
        {
            HttpSession session = req.getSession();
            String id = (String)session.getAttribute("id");
            if(id == null)
            {
                req.setAttribute("msg", "로그인이 필요합니다.");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
            else
            {
                MemberDTO dto = service.MemberSearch(id);
                req.setAttribute("dto", dto);
                req.getRequestDispatcher("/WEB-INF/member/myInfo.jsp").forward(req, resp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
}
