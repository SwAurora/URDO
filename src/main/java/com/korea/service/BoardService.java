package com.korea.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.Part;

import com.korea.dao.BoardDAO;
import com.korea.dto.BoardDTO;
import com.korea.dto.RecDTO;
import com.korea.dto.ReplyDTO;

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

    public List<BoardDTO> getBestNow(int start, int limit)
    {
        return dao.SelectBestNow(start, limit);
    }

    public List<BoardDTO> getBestMonth(int start, int limit)
    {
        return dao.SelectBestMonth(start, limit);
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
        File RealPath;
        if(rootPath.contains("metadata"))
        {
            rootPath = rootPath.replaceAll("/WEB-INF/classes", "");
            RealPath = new File(rootPath + "/resources/files/" + subPath);
        }
        else
        {
            rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
            RealPath = new File(rootPath + "/src/main/webapp/resources/files/" + subPath);
        }
        
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

        // DTO에 총파일명 저장
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

    // ------------------------------------------------------------------- 게시글 수정 시작

    public void update(BoardDTO dto)
    {
        dao.update(dto);
    }

    public void update(BoardDTO dto, String delfiles)
    {
        String filename = dto.getFilename();
        String[] files = delfiles.split(";");
        for(String file : files)
        {
            filename = filename.replaceAll(file + ";", "");
            File file2 = fileChk(String.valueOf(dto.getNo()));
            if(file2.exists())
            {
                for(File files2 : Objects.requireNonNull(file2.listFiles()))
                {
                    if(files2.getName().equals(file))
                    {
                        files2.delete();
                    }
                }
                file2.delete();
            }

        }
        dto.setFilename(filename);
        dao.updateWithFile(dto);
    }

    public void update(BoardDTO dto, ArrayList<Part> Parts)
    {
        String subPath = "B" + (dto.getNo());
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        File RealPath;
        if(rootPath.contains("metadata"))
        {
            rootPath = rootPath.replaceAll("/WEB-INF/classes", "");
            RealPath = new File(rootPath + "/resources/files/" + subPath);
        }
        else
        {
            rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
            RealPath = new File(rootPath + "/src/main/webapp/resources/files/" + subPath);
        }

        if(!RealPath.exists())
            RealPath.mkdirs();

        StringBuilder totalFilename = new StringBuilder();
        if(!dto.getFilename().equals("null"))
        {
            totalFilename.append(dto.getFilename());
        }

        for(Part part : Parts)
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

        dto.setFilename(totalFilename.toString());

        dao.updateWithFile(dto);
    }

    public void update(BoardDTO dto, String delfiles, ArrayList<Part> Parts)
    {
        String filename = dto.getFilename();
        String[] files = delfiles.split(";");
        for(String file : files)
        {
            filename = filename.replaceAll(file + ";", "");
            File file2 = fileChk(String.valueOf(dto.getNo()));
            if(file2.exists())
            {
                for(File files2 : Objects.requireNonNull(file2.listFiles()))
                {
                    if(files2.getName().equals(file))
                    {
                        files2.delete();
                    }
                }
            }

        }

        String subPath = "B" + (dto.getNo());
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        File RealPath;
        if(rootPath.contains("metadata"))
        {
            rootPath = rootPath.replaceAll("/WEB-INF/classes", "");
            RealPath = new File(rootPath + "/resources/files/" + subPath);
        }
        else
        {
            rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
            RealPath = new File(rootPath + "/src/main/webapp/resources/files/" + subPath);
        }

        if(!RealPath.exists())
            RealPath.mkdirs();

        StringBuilder totalFilename = new StringBuilder();
        if(!filename.equals(""))
            totalFilename.append(filename);

        for(Part part : Parts)
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

        dto.setFilename(totalFilename.toString());

        dao.updateWithFile(dto);
    }

    // ------------------------------------------------------------------- 게시글 수정 끝
    public boolean delete(int no)
    {
        File file = fileChk(String.valueOf(no));
        if(file.exists())
        {
            for(File files : Objects.requireNonNull(file.listFiles()))
            {
                files.delete();
            }
            file.delete();
        }
        return dao.delete(no);
    }
    
    // 댓글 서비스 시작
    public boolean reply(ReplyDTO rdto)
    {
        return dao.reply(rdto);
    }

    public ArrayList<ReplyDTO> getReplylist(int bno)
    {
        return dao.getReplylist(bno);
    }
    
    public boolean replyDelete(int no) {
    	return dao.replyDelete(no);
    }
    // 댓글 서비스 끝


    public File fileChk(String no)
    {
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        if(rootPath.contains("metadata"))
        {
            rootPath = rootPath.replaceAll("/WEB-INF/classes", "");
            rootPath = rootPath + "/resources/files/";
        }
        else
        {
            rootPath = rootPath.replaceAll("target/URDO-1.0-SNAPSHOT/WEB-INF/classes/", "");
            rootPath = rootPath + "/src/main/webapp/resources/files/";
        }
        return new File(rootPath + "B" + no);
    }

    // 조회수 증가
    public void ViewsUp(int no)
    {
        dao.ViewsUp(no);
    }

    public int recCheck(RecDTO dto)
    {
        return dao.recCheck(dto);
    }

    public void recUpdate(RecDTO dto)
    {
        dao.recUpdate(dto);
    }

    public void recUp(int bno)
    {
        dao.recUp(bno);
    }
    public void dayRecUp(int bno)
    {
        dao.dayRecUp(bno);
    }
    public void monthRecUp(int bno)
    {
        dao.monthRecUp(bno);
    }

    public int recCount(int no)
    {
        return dao.recCount(no);
    }
    public int getDayRec(int bno)
    {
        return dao.getDayRec(bno);
    }
    public int getMonthRec(int bno)
    {
        return dao.getMonthRec(bno);
    }

    // 마이페이지 정보 조회
    public int getMyPost(String nickname)
    {
        return dao.getMyPost(nickname);
    }
    public int getMyReply(String id)
    {
        return dao.getMyReply(id);
    }
    public int getMyReceivedRec(String nickname)
    {
        return dao.getMyReceivedRec(nickname);
    }
    public int getMyRec(String id)
    {
        return dao.getMyRec(id);
    }

    public void bestNowUp(int bno)
    {
        dao.bestNowUp(bno);
    }
    public void bestMonthUp(int bno)
    {
        dao.bestMonthUp(bno);
    }

    public int getBestNowTotalCount()
    {
        return dao.getBestNowTotalCount();
    }

    public int getBestMonthTotalCount()
    {
        return dao.getBestMonthTotalCount();
    }
}
