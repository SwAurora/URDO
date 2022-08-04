package com.korea.controller.urpo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.MemberService;
import com.korea.service.UrpoService;

public class UrpoPurchaseController implements SubController
{

    UrpoService service = UrpoService.getInstance();
    MemberService mservice = MemberService.getInstance();
    UrpoDTO dto = new UrpoDTO();
    MemberDTO mdto = new MemberDTO();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");
        int no = Integer.parseInt(req.getParameter("no"));
        int price = Integer.parseInt(req.getParameter("price"));

        mdto = mservice.MemberSearch(id);
        service.purchase(mdto, price, no);
        int remains = mdto.getPoint() - price;

        req.setAttribute("msg", "구매 성공! 남은 포인트 : " + remains);
        req.setAttribute("dto", dto);
        try
        {
            req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}