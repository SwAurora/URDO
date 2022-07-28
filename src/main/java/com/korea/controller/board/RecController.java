package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.RecDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class RecController implements SubController
{
    BoardService service = BoardService.getInstance();

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
                out.print("추천 성공!");
            }
            else
            {
                out.print("이미 추천한 게시글입니다.");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
