package com.korea.controller.urpo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.MemberService;
import com.korea.service.UrpoService;

public class UrpoReadController implements SubController
{

    UrpoService service = UrpoService.getInstance();
    MemberService mservice = MemberService.getInstance();
    UrpoDTO dto = new UrpoDTO();
    MemberDTO mdto = new MemberDTO();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            HttpSession session = req.getSession();
            String id = (String) session.getAttribute("id");
            if(id != null)
            {
                mdto = mservice.MemberSearch(id);
                req.setAttribute("mdto", mdto);
            }

            String no = req.getParameter("no");
            dto = service.Select(Integer.parseInt(no));

            req.setAttribute("dto", dto);
            req.getRequestDispatcher("/URPO/urconRead.jsp?no=" + no).forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
