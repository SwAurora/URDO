package com.korea.controller.member;

import com.korea.controller.SubController;
import com.korea.dto.MemberDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.BoardService;
import com.korea.service.MemberService;
import com.korea.service.UrpoService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowInfoController implements SubController
{
    MemberService service = MemberService.getInstance();
    UrpoService uservice = UrpoService.getInstance();

    BoardService bservice = BoardService.getInstance();
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

                int myPost = bservice.getMyPost(dto.getNickname());
                int myReply = bservice.getMyReply(dto.getId());
                int myReceivedRec = bservice.getMyReceivedRec(dto.getNickname());
                int myRec = bservice.getMyRec(dto.getId());
                List<Integer> myList = new ArrayList<>();
                myList.add(myPost);
                myList.add(myReply);
                myList.add(myReceivedRec);
                myList.add(myRec);
                req.setAttribute("mylist", myList);
                
                // 멤버가 가지고있는 아이콘 정보 불러오기
                UrpoDTO udto = uservice.Select(dto.getIcon());
                req.setAttribute("udto", udto);
                
                // 멤버 정보에 있는 아이템리스트의 아이템 정보 불러오기
                String[] nolist = dto.getItems().split(";");
                List<UrpoDTO> list = uservice.ShowItems(nolist);
                req.setAttribute("itemlist", list);
                
                req.getRequestDispatcher("/WEB-INF/member/myInfo.jsp").forward(req, resp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
}
