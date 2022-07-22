package com.korea.controller.urpo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.MemberService;
import com.korea.service.UrpoService;

public class ProduceController implements SubController{
	
    UrpoService service = UrpoService.getInstance();
    MemberService mservice = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        try
        {
            if(flag == null) // 게시판에서 게시글 작성 누른 경우
            {
                req.getRequestDispatcher("/URPO/produce.jsp").forward(req, resp);
            }
            else // post.jsp에서 등록할 내용을 기입하고 글쓰기 버튼을 누른 경우
            {
            	String category = req.getParameter("category");
                String title = req.getParameter("title");
                String discription = req.getParameter("discription");
                String gifImage = req.getParameter("gifImage");
                int price = Integer.parseInt(req.getParameter("price"));
                HttpSession session = req.getSession();
                String id = (String) session.getAttribute("id");
                MemberDTO mdto = mservice.MemberSearch(id);
                String producer = mdto.getNickname();
                if(category.equals("") || title.equals("") || discription.equals(""))
                {
                    req.setAttribute("msg", "비어있는 내용이 있습니다.");
                    req.getRequestDispatcher("/URPO/produce.jsp").forward(req, resp);
                    return;
                }

                UrpoDTO dto = new UrpoDTO();
                dto.setCategory(category);
                dto.setTitle(title);
                dto.setDiscription(discription);
                dto.setProducer(producer);
                dto.setGifImage(gifImage);
                dto.setPrice(price);

                boolean result = service.ProduceUrcon(dto);

                if(result)
                {
                    req.setAttribute("msg", "작성을 완료했습니다.");
                    req.getRequestDispatcher("/URPO.do").forward(req, resp);
                }
                else
                {
                    req.setAttribute("msg", "작성에 실패했습니다.");
                    req.getRequestDispatcher("/URPO/produce.jsp").forward(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
