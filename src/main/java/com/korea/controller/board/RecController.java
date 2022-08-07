package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.RecDTO;
import com.korea.service.BoardService;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class RecController implements SubController
{
    BoardService service = BoardService.getInstance();
    MemberService mservice = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            String no = req.getParameter("no");
            String id = req.getParameter("id");
            PrintWriter out = resp.getWriter();

            RecDTO dto = new RecDTO();
            dto.setBoard_no(Integer.parseInt(no));
            dto.setRec_id(id);
            // 동일 게시글에 대한 이전 추천 여부 검색
            int result = service.recCheck(dto);
            

            if(result < 1)
            {
                // 추천하지 않았다면 추천 추가
                service.recUpdate(dto);
                service.recUp(Integer.parseInt(no));
                service.dayRecUp(Integer.parseInt(no));
                service.monthRecUp(Integer.parseInt(no));

                int dayRec = service.getDayRec(Integer.parseInt(no));
                int monthRec = service.getMonthRec(Integer.parseInt(no));
                // 추천 수 하루에 20개면 실시간 베스트 올리고 월에 50개면 월간 베스트 올림
                if(dayRec == 20)
                {
                    service.bestNowUp(Integer.parseInt(no));
                }
                if(monthRec == 50)
                {
                    service.bestMonthUp(Integer.parseInt(no));
                }
                // 추천됐으니까 포인트도 증가
                mservice.getPoint(2, id);
                out.print("<script>modal_open();</script>");
            }
            else
            {
                out.print("<script>alert('이미 추천한 게시글입니다.')</script>");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
