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
        String subPath = "B" + (dao.getLastNo());
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
        File RealPath = new File(rootPath + "/src/main/webapp/resources/files/" + subPath);

        if(!RealPath.exists())
            RealPath.mkdirs();

        StringBuilder totalFilename = new StringBuilder();

        for(Part part : parts)
        {
            if(part.getName().equals("files"))
            {
                String FileName = getFileName(part);

                totalFilename.append(FileName).append(";");

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

    // 게시글 번호와 subject로 게시글 불러오기
    public BoardDTO Select(int no)
    {
        return dao.Select(no);
    }

    public boolean delete(int no)
    {
        return dao.delete(no);
    }

    public File[] fileChk(String no)
    {
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
        rootPath = rootPath + "/src/main/webapp/resources/files/";

        File file = new File(rootPath + "B" + no);
        return file.listFiles();
    }

    // 조회수 증가
    public void ViewsUp(int no)
    {
        dao.ViewsUp(no);
    }
}
