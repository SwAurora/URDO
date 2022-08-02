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
                if(pwd == null)
                {
                    req.setAttribute("msg", "비밀번호가 비어 있습니다. 비밀번호를 입력해주세요");
                    req.getRequestDispatcher("/WEB-INF/member/myInfo.jsp").forward(req, resp);
                }
                else
                {
                    req.setAttribute("msg", "회원 탈퇴 성공 안녕히 가세요");
                    boolean result = service.DeleteMember(id);
                    resp.sendRedirect("/Delete.do?result=" + result);
                    req.getRequestDispatcher("/").forward(req, resp);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
