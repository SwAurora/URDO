package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.ArrayList;

public class PostUpdateController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        String no = req.getParameter("no");

        if(flag == null)
        {
            try
            {
                BoardDTO dto = service.Select(Integer.parseInt(no));
                req.setAttribute("dto", dto);
                req.getRequestDispatcher("/WEB-INF/board/postUpdate.jsp").forward(req, resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            String subject = req.getParameter("subject");
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            String filename = req.getParameter("filename");

            BoardDTO dto = new BoardDTO();
            dto.setNo(Integer.parseInt(no));
            dto.setTitle(title);
            dto.setContent(content.replaceAll("\n", "<br>"));
            dto.setFilename(filename);

            String delfiles = req.getParameter("delfiles");

            try
            {
                ArrayList<Part> parts = (ArrayList<Part>) req.getParts();
                long size = 0;
                for(Part part : parts)
                {
                    if(part.getName().equals("files"))
                    {
                        size += part.getSize();
                    }
                }
                if(size == 0 && delfiles.equals("")) // 첨부파일이 없고 삭제한 파일도 없는 경우
                {
                    service.update(dto);
                }
                else if(size == 0) // 첨부파일이 없고 삭제한 파일만 있는 경우
                {
                    service.update(dto, delfiles);
                }
                else if(delfiles.equals("")) // 첨부파일이 있고 삭제한 파일은 없는 경우
                {
                    service.update(dto, parts);
                }
                else
                {
                    service.update(dto, delfiles, parts);
                }

                req.setAttribute("msg", "수정되었습니다.");
                req.getRequestDispatcher("/Board/" + subject + ".do").forward(req,resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
