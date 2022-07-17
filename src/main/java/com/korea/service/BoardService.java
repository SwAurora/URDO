package com.korea.service;

import com.korea.dao.BoardDAO;
import com.korea.dto.BoardDTO;

import javax.servlet.http.Part;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

public class BoardService
{
    BoardDAO dao = BoardDAO.getInstance();

    private static BoardService instance = null;
    public static BoardService getInstance()
    {
        if(instance == null)
        {
            instance = new BoardService();
        }
        return instance;
    }

    private BoardService()
    {

    }

    public List<BoardDTO> getBoardList(String subject, int start, int limit)
    {
        return dao.Select(subject, start, limit);
    }

    public int getTotalCnt(String table)
    {
        return dao.getTotalCount(table);
    }

    public boolean PostBoard(BoardDTO dto)
    {
        return dao.insert(dto);
    }

    //파일포함 글쓰기 서비스
    public boolean PostBoard(BoardDTO dto, ArrayList<Part> parts)
    {
        String writer = dto.getWriter();
        Date now = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = simpleDateFormat.format(now);
        String subPath = writer + "/" + date;
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
        File RealPath = new File(rootPath + "/files/" + subPath);

        if(!RealPath.exists())
            RealPath.mkdirs();

        StringBuilder totalFilename = new StringBuilder();

        for(Part part : parts)
        {
            if(part.getName().equals("files"))
            {
                String FileName = getFileName(part);

                totalFilename.append(FileName).append(";");

                String ext = FileName.substring(FileName.lastIndexOf(".") + 1);
                FileName = FileName.replaceAll("." + ext, "");
                FileName = FileName + "_" + UUID.randomUUID() + "." + ext;
                try
                {
                    part.write(RealPath + "/" + FileName);
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
        }

        // DTO에 총파일명과 총파일사이즈를 저장
        dto.setFilename(totalFilename.toString());

        // DAO 파일명 전달
        return dao.insert(dto);
    }

    // 파일명추출(PostBoard(dto, parts)에서 사용)
    private String getFileName(Part part)
    {
        String contentDisp = part.getHeader("content-disposition");
        String[] arr = contentDisp.split(";");
        return arr[2].substring(11, arr[2].length() - 1);
    }
}
