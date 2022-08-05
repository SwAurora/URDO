package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpController implements SubController
{
    private MemberService service = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");

        try
        {
            if(flag == null)
            {
                req.getRequestDispatcher("/WEB-INF/member/signUp.jsp").forward(req, resp);
            }
            else
            {
                String id = req.getParameter("id");
                String pw = req.getParameter("pw");
                String email = req.getParameter("email");
                String nickname = req.getParameter("nickname");

                // 아이디, 닉네임 중복 체크 후 회원가입
                if(service.checkId(id) == 1)
                {
                    req.setAttribute("msg", "이미 존재하는 아이디입니다.");
                    req.setAttribute("back", "<script>history.back();</script>");
                    req.getRequestDispatcher("/WEB-INF/member/signUp.jsp").forward(req, resp);
                }
                else if(service.checkNickname(nickname) == 1)
                {
                    req.setAttribute("msg", "이미 존재하는 닉네임입니다.");
                    req.setAttribute("back", "<script>history.back();</script>");
                    req.getRequestDispatcher("/WEB-INF/member/signUp.jsp").forward(req, resp);
                }
                else
                {
                    MemberDTO dto = new MemberDTO();
                    dto.setId(id);
                    dto.setPw(pw);
                    dto.setEmail(email);
                    dto.setNickname(nickname);
                    boolean result = service.MemberInsert(dto);

                    if(result)
                    {
                        req.setAttribute("msg", nickname + "님 가입해 주셔서 감사합니다.");
                        req.getRequestDispatcher("login.jsp").forward(req, resp);
                    }

                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
