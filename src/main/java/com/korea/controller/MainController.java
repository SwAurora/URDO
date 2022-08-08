package com.korea.controller;

import com.korea.dto.BoardDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.BoardService;
import com.korea.service.UrpoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MainController implements SubController
{
    BoardService service = BoardService.getInstance();
    UrpoService uservice = UrpoService.getInstance();
    String category = "urcon";
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            List<BoardDTO> list = service.SelectBestHumor();
            List<BoardDTO> list2 = service.getBestNow();
            List<BoardDTO> list3 = service.getBestMonth();
            req.setAttribute("list", list);
            req.setAttribute("list2", list2);
            req.setAttribute("list3", list3);
            
            // 포인트샵 setAttribute
            List<UrpoDTO> urconList = uservice.ShowItems(category, 0, 12);
            req.setAttribute("urconList", urconList);
            List<UrpoDTO> urconList2 = uservice.ShowItems(category, 13, 12);
            req.setAttribute("urconList2", urconList2);
            
            req.getRequestDispatcher("main.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
